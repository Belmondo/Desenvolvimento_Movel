import 'package:flutter/material.dart';

class EntradaTexto extends StatelessWidget {
  late String _textoDigitado = "";

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 10,
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: 'Digite um CEP'),
      onChanged: (value) {
        _textoDigitado = value;
      },
    );
  }

  String getTextoDigitado() {
    return _textoDigitado;
  }
}
