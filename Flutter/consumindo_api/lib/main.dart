import 'dart:convert';
import 'retorno_api.dart';
import 'campo_texto.dart';
import 'package:flutter/material.dart';
import "botao.dart";
import "package:http/http.dart" as http;
import 'modelo/traducao.dart';

main() {
  runApp(ConsomeApiApp());
}

class ConsomeApiState extends State<ConsomeApiApp> {
  var perguntaSelecionada = 0;
  String mil = " ";
  Texto campo_de_texto = new Texto();
  String URL = "api.funtranslations.com";
  String PATH = "/translate/dothraki.json";
  late Map<String, String> _queryParameters;

  Future getTextoTraduzido() async {
    Traducao textoTraduzido;
    var response = await http.get(Uri.https(URL, PATH, _queryParameters));
    //print(response.request);
    //print(response.body);
    var jsonData = jsonDecode(response.body);
    //print(jsonData);
    mudaParametro();
    var content = jsonData['contents'];
    textoTraduzido = new Traducao(content['translated'].toString());
    //campo_saida.atualizaTexto(textoTraduzido.getTraducao());
    //campo_saida.atualizaTexto("cuida  ");
    print("entrou aqui");
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
        'text': campo_de_texto.getTextoDigitado(),
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
            campo_de_texto,
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
