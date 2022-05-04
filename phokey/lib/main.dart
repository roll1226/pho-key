import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phokey/controllers/keyhole_controller.dart';
import 'package:phokey/models/keyhole/keyhole_model.dart';
import 'package:phokey/view/detail_page.dart';
import 'package:phokey/view/widgets/create_dialog.dart';
import 'package:phokey/view/widgets/list_card.dart';
import 'package:phokey/repositories/custom_exception.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: HomeApp(camera: firstCamera)));
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key, required this.camera}) : super(key: key);
  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PHO-KEY',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),

      // リストの表示
      home: Screen(camera: camera),
    );
  }
}

class Screen extends HookConsumerWidget {
  const Screen({
    Key? key,
    required this.camera,
  }) : super(key: key);
  final CameraDescription camera;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final latitude = useState('');
    final longitude = useState('');

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
      latitude.value = position.latitude.toString();
      longitude.value = position.longitude.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('pho-key'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: KeyholeList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _determinePosition();
          return AddKeyholeDialog.show(context, Keyhole.empty(), camera,
              latitude.value, longitude.value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class KeyholeList extends HookConsumerWidget {
  const KeyholeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyholeListState = ref.watch(keyholeControllerProvider);

    return keyholeListState.when(
        data: (keyholes) => keyholes.isEmpty
            ? const Center(child: Text('鍵がありません'))
            : ListView.builder(
                itemCount: keyholes.length,
                itemBuilder: (BuildContext context, int index) {
                  final keyhole = keyholes[index];
                  return ListCard(
                    imagePath: keyhole.imagePath,
                    keyholeId: keyhole.id,
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPageScreen(
                                    keyholeId: keyhole.id,
                                    imagePath: keyhole.imagePath,
                                    body: keyhole.body,
                                  )))
                    },
                  );
                },
              ),
        error: (error, _) => KeyholeListError(
              message: error is CustomException
                  ? error.message!
                  : 'Something went wrong!',
            ),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

class KeyholeListError extends HookConsumerWidget {
  final String message;
  const KeyholeListError({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(fontSize: 20.0)),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => ref
                .read(keyholeControllerProvider.notifier)
                .retrieveKeyholes(isRefreshing: true),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
