import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? text = "";
  Function onPressed;
  IconData? icon;

  Widget? widget;

  CustomButton({required this.text, required this.onPressed});
  CustomButton.withIcon({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (text == "") {
      widget = Icon(icon);
    } else {
      widget = Text(text!);
    }
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Text("Buscar"),
    );
  }
}
