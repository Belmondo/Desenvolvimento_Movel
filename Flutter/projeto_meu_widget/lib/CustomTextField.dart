import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  bool? obscureText;

  CustomTextField.withoutObscure({required this.labelText});
  CustomTextField.withObscure(
      {required this.labelText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
