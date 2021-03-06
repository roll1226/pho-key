import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phokey/common/generate_nonce.dart';
import 'package:phokey/controllers/keyhole_controller.dart';
import 'package:phokey/models/keyhole/keyhole_model.dart';
import 'package:phokey/view/widgets/Loading_circle.dart';
import 'package:phokey/view/widgets/create_dialog_button.dart';

class AddKeyholeDialog extends HookConsumerWidget {
  static void show(BuildContext context, Keyhole keyhole,
      CameraDescription camera, String latitude, String longitude) {
    showDialog(
      context: context,
      builder: (context) => AddKeyholeDialog(
        keyhole: keyhole,
        camera: camera,
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  final Keyhole keyhole;
  final CameraDescription camera;
  final String latitude;
  final String longitude;

  const AddKeyholeDialog(
      {Key? key,
      required this.keyhole,
      required this.camera,
      required this.latitude,
      required this.longitude})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController(text: keyhole.body);
    final _imagePath = useState('');
    final _isLoading = useState(false);

    return Stack(
      children: <Widget>[
        Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_imagePath.value.isNotEmpty)
                  Image.network(
                    _imagePath.value,
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(hintText: '???????????????'),
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CreateDialogButton(
                            icon: Icons.post_add,
                            label: '??????',
                            onPressed: textController.text.trim() == "" ||
                                    _imagePath.value == ""
                                ? null
                                : () async {
                                    _isLoading.value = true;
                                    await ref
                                        .read(
                                            keyholeControllerProvider.notifier)
                                        .addKeyhole(
                                            body: textController.text.trim(),
                                            imagePath: _imagePath.value,
                                            latitude: latitude,
                                            longitude: longitude);
                                    _isLoading.value = false;
                                    Navigator.of(context).pop();
                                  }),
                        CreateDialogButton(
                            icon: Icons.camera_alt,
                            label: '????????????',
                            onPressed: () async {
                              _imagePath.value =
                                  await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => TakePictureScreen(
                                    camera: camera,
                                  ),
                                ),
                              );
                            })
                      ],
                    )),
              ],
            ),
          ),
        ),
        LoadingCircle(isLoading: _isLoading.value),
      ],
    );
  }
}

/// ??????????????????
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

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
      // ??????????????????
      widget.camera,
      // ??????????????????
      ResolutionPreset.medium,
    );

    // ?????????????????????????????????
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // ????????????????????????????????????????????????????????????????????????
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('????????????')),
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
          // ???????????????
          final image = await _controller.takePicture();
          // ???????????????????????????
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

// ???????????????????????????????????????
class DisplayPictureScreen extends HookConsumerWidget {
  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isLoading = useState(false);

    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(title: const Text('???????????????')),
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
                    label: '????????????',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CreateDialogButton(
                    icon: Icons.camera_alt,
                    label: '?????????????????????',
                    onPressed: () async {
                      final storageRef = FirebaseStorage.instance.ref();
                      final mountainsRef = storageRef
                          .child("keyholeImage/" + generateNonce() + ".jpg");
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
        ),
        LoadingCircle(isLoading: _isLoading.value)
      ],
    );
  }
}
