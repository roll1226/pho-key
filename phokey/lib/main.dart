import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phokey/controllers/keyhole_controller.dart';
import 'package:phokey/view/detail_page.dart';
import 'package:phokey/view/widgets/list_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: HomeApp()));
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PHO-KEY',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),

      // リストの表示
      home: Screen(),
    );
  }
}

class Screen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final KeyholesListState = ref.watch(keyholeControllerProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('pho-key'),
        ),
        body: const KeyholeList()
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     // "push"で新規画面に遷移
        //     // リスト追加画面の値を取得
        //     final newListText = await Navigator.of(context).push(
        //       MaterialPageRoute(builder: (context) {
        //         // 遷移先の画面としてリスト追加画面を指定
        //         return TodoAddPage();
        //       }),
        //     );

        //     if (newListText != null) {
        //       setState(() {
        //         todoList.add(newListText);
        //       });
        //     }
        //   },
        //   child: Icon(Icons.add),
        // ),
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
                      imagePath: keyhole.imagePath, keyholeId: keyhole.id);
                },
              ),
        error: (error, _) => const KeyholeListError(
              message: 'Something went wrong!',
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
