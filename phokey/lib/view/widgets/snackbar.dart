import 'package:flutter/material.dart';

class Snackbar extends StatelessWidget {
  const Snackbar({Key? key, @required required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // 成功の場合のSnackBar
  static show(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.check,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
            height: 50,
          ),
          Text(message),
        ],
      ),
      duration: const Duration(milliseconds: 3000),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ));
  }

  // 失敗の場合のSnackBar
  static showError(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
            height: 50,
          ),
          Text(message),
        ],
      ),
      duration: const Duration(milliseconds: 3000),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ));
  }
}
