import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key, this.imagePath, this.keyholeId, this.onPressed})
      : super(key: key);

  final String? imagePath;
  final String? keyholeId;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: <Widget>[
            Image.network(
              imagePath ??
                  'https://www.shoshinsha-design.com/wp-content/uploads/2020/05/noimage-760x460.png',
              height: 300,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
                margin: EdgeInsets.all(10.0),
                child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: onPressed,
                      icon: const Icon(Icons.key),
                      label: const Text('解錠'),
                    )
                  ],
                )),
          ],
        ));
  }
}
