import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({Key? key, required this.isLoading}) : super(key: key);
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))
              ],
            ),
          )
        : Container();
  }
}
