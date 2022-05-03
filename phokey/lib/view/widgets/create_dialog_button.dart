import 'package:flutter/material.dart';

class CreateDialogButton extends StatelessWidget {
  const CreateDialogButton(
      {Key? key, required this.icon, required this.label, this.onPressed})
      : super(key: key);

  final IconData icon;
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
