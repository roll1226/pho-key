import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phokey/controllers/keyhole_controller.dart';
import 'package:phokey/repositories/custom_exception.dart';
import 'package:phokey/view/widgets/detail_card.dart';

class DetailPageScreen extends StatelessWidget {
  // ここにイニシャライザを書く
  const DetailPageScreen(
      {Key? key,
      required this.keyholeId,
      required this.imagePath,
      required this.body})
      : super(key: key);
  final String? keyholeId;
  final String? imagePath;
  final String? body;

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
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(builder: (context) {
      //         return const DetailPageApp(
      //           keyholeId: 'asd',
      //         );
      //       }),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

class KeyholeDetail extends HookConsumerWidget {
  const KeyholeDetail(
      {Key? key,
      required this.keyholeId,
      required this.imagePath,
      required this.body})
      : super(key: key);
  final String? keyholeId;
  final String? imagePath;
  final String? body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DetailCard(keyholeId: keyholeId, imagePath: imagePath);
  }
}

// class DetailPage extends StatefulWidget {
//   @override
//   _DetailPage createState() => _DetailPage();
// }

// class _DetailPage extends State<DetailPage> {}
