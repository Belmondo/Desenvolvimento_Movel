import 'dart:convert';
import 'retorno_api.dart';
import 'entrada_texto.dart';
import 'package:flutter/material.dart';
import "botao.dart";
import "package:http/http.dart" as http;
import 'modelo/traducao.dart';

main() {
  runApp(ConsomeApiApp());
}

class ConsomeApiState extends State<ConsomeApiApp> {
  String mil = " ";
  EntradaTexto entradaTexto = new EntradaTexto();
  String URL = "api.funtranslations.com";
  String PATH = "/translate/dothraki.json";
  late Map<String, String> _queryParameters;

  Future getTextoTraduzido() async {
    Traducao textoTraduzido;
    var response = await http.get(Uri.https(URL, PATH, _queryParameters));
    var jsonData = jsonDecode(response.body);
    mudaParametro();
    var content = jsonData['contents'];
    textoTraduzido = new Traducao(content['translated'].toString());
    muda(textoTraduzido.getTraducao());
  }

  void muda(String textoTraduzido) {
    setState(() {
      mil = textoTraduzido;
    });
  }

  void mudaParametro() {
    _queryParameters = <String, String>{
      'text': "",
    };
  }

  void answer() {
    setState(() {
      _queryParameters = <String, String>{
        'text': entradaTexto.getTextoDigitado(),
      };
      getTextoTraduzido();
      //print(PATH);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Consumindo API'),
        ),
        body: Column(
          children: <Widget>[
            entradaTexto,
            new Botao('Traduza para mim', answer),
            new RetornoAPI(mil),
          ],
        ),
      ),
    ); //Material App
  }
}

class ConsomeApiApp extends StatefulWidget {
  const ConsomeApiApp({super.key});

  ConsomeApiState createState() {
    return ConsomeApiState();
  }
}
