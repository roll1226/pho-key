import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phokey/common/generate_nonce.dart';
import 'package:phokey/controllers/keyhole_controller.dart';
import 'package:phokey/view/widgets/create_dialog_button.dart';
import 'package:phokey/view/widgets/detail_card.dart';

class DetailPageScreen extends StatelessWidget {
  // ここにイニシャライザを書く
  const DetailPageScreen(
      {Key? key,
      required this.keyholeId,
      required this.imagePath,
      required this.body,
      required this.camera})
      : super(key: key);
  final String? keyholeId;
  final String? imagePath;
  final String? body;
  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('解錠'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: KeyholeDetail(
            keyholeId: keyholeId,
            imagePath: imagePath,
            body: body,
            camera: camera),
      ),
    );
  }
}

class KeyholeDetail extends HookConsumerWidget {
  const KeyholeDetail(
      {Key? key,
      required this.keyholeId,
      required this.imagePath,
      required this.body,
      required this.camera})
      : super(key: key);
  final String? keyholeId;
  final String? imagePath;
  final String? body;
  final CameraDescription camera;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _latitude = useState('');
    final _longitude = useState('');
    final _imagePath = useState('');

    /// デバイスの現在位置を決定する。
    /// 位置情報サービスが有効でない場合、または許可されていない場合。
    /// エラーを返します
    Future<void> _determinePosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      // 位置情報サービスが有効かどうかをテストします。
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // 位置情報サービスが有効でない場合、続行できません。
        // 位置情報にアクセスし、ユーザーに対して
        // 位置情報サービスを有効にするようアプリに要請する。
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        // ユーザーに位置情報を許可してもらうよう促す
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // 拒否された場合エラーを返す
          return Future.error('Location permissions are denied');
        }
      }

      // 永久に拒否されている場合のエラーを返す
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // ここまでたどり着くと、位置情報に対しての権限が許可されているということなので
      // デバイスの位置情報を返す。
      final position = await Geolocator.getCurrentPosition();
      _latitude.value = position.latitude.toString();
      _longitude.value = position.longitude.toString();
    }

    return DetailCard(
      keyholeId: keyholeId,
      imagePath: imagePath,
      onPressed: () async {
        await _determinePosition();
        _imagePath.value = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TakePictureScreen(
              camera: camera,
              keyholeId: keyholeId,
            ),
          ),
        );
        final isCompareImage = await ref
            .read(keyholeControllerProvider.notifier)
            .compareImage(
                keyholeId: keyholeId!,
                keyPath: _imagePath.value != '' ? _imagePath.value : '',
                latitude: _latitude.value,
                longitude: _longitude.value);

        if (isCompareImage) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Row(children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text('一致した'),
                )
              ])));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Row(children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text('一致していない'),
                )
              ])));
        }
      },
    );
  }
}

/// 写真撮影画面
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key? key, required this.camera, this.keyholeId})
      : super(key: key);

  final CameraDescription camera;
  final String? keyholeId;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      // カメラを指定
      widget.camera,
      // 解像度を定義
      ResolutionPreset.medium,
    );

    // コントローラーを初期化
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // ウィジェットが破棄されたら、コントローラーを破棄
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('写真撮影')),
      body: Center(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 写真を撮る
          final image = await _controller.takePicture();
          // 表示用の画面に遷移
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DisplayPictureScreen(imagePath: image.path),
            ),
          );
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// 撮影した写真を表示する画面
class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('撮れた写真')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Image.file(File(imagePath))),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CreateDialogButton(
                icon: Icons.camera_alt,
                label: '取り直す',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CreateDialogButton(
                icon: Icons.camera_alt,
                label: 'この写真にする',
                onPressed: () async {
                  final storageRef = FirebaseStorage.instance.ref();
                  final mountainsRef =
                      storageRef.child("keyImage/" + generateNonce() + ".jpg");
                  await mountainsRef.putFile(File(imagePath));
                  debugPrint(await mountainsRef.getDownloadURL());

                  Navigator.of(context)
                      .pop(await mountainsRef.getDownloadURL());
                  Navigator.of(context)
                      .pop(await mountainsRef.getDownloadURL());
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
