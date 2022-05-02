import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:phokey/view/widgets/list_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomeApp());
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
      home: KeyholesList(),
    );
  }
}

class KeyholesList extends StatefulWidget {
  @override
  _KeyholeListState createState() => _KeyholeListState();
}

class _KeyholeListState extends State<KeyholesList> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pho-key'),
      ),
      body: _buildList(context),
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

  Widget _buildList(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('keyholes').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //データを取得できなかった場合の返り値を指定
        if (snapshot.hasError) {
          return const Center(
            child: Text('取得できませんでした'),
          );
        }
        //取得中の返り値を指定Text(message['text'])
        if (!snapshot.hasData) {
          return const Center(
            child: Text("ローディング..."),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> keyhole =
                document.data()! as Map<String, dynamic>;
            Key docId = Key(document.id);
            return ListCard(
              key: docId,
              imagePath: keyhole['imagePath'],
              keyholeId: document.id,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(children: [
                    Icon(Icons.delete, color: Colors.white),
                    SizedBox(width: 20),
                    Expanded(child: Text('削除したでぇ'))
                  ]),
                ));
              },
            );
          }).toList(),
        );
      },
    );
  }
}
