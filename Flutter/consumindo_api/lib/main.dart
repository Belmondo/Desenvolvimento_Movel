import 'dart:convert';

import 'package:consumindo_api/modelo/ResultCep.dart';
//import 'package:consumindo_api/modelo/pessoa.dart';
import 'MeuBotao.dart';
import 'entrada_texto.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

main() {
  runApp(ConsomeApiApp());
}

class ConsomeApiState extends State<ConsomeApiApp> {
  String infos = " ";
  EntradaTexto entradaTexto = new EntradaTexto();
  late String CEP_DIGITADO;
  late String URL;
  String logradouro = "Logradouro: ";
  String complemento = "Complemento: ";
  String bairro = "Bairro: ";
  String localidade = "Localidade: ";
  //late String URL2;
  //late Map<String, String> _queryParameters;
  //Pessoa? resultadoLista;
  //String textoUm = "";
  //String textoDois = "";

  Future getInformacoes(String cep) async {
    ResultCep resultado;
    URL = "http://viacep.com.br/ws/$cep/json/";
    print(URL);
    var response = await http.get(Uri.parse(URL));
    print(response);

    if (response.statusCode == 200) {
      print("oremos");
      print(response.body);
      var jsonData = jsonDecode(response.body);
      resultado = new ResultCep.fromJson(jsonData);
      muda(resultado);
    } else {
      print("Falha ao buscar o CEP ${response.statusCode}");
    }
/*
    //print(response);
    //var jsonData = jsonDecode(response.body);
    //print(response.statusCode);
    //mudaParametro();
    //var content = jsonData['contents'];
    //textoTraduzido = new Traducao(content['translated'].toString());
    //muda(textoTraduzido.getTraducao());
    */
  }

  muda(ResultCep resultado) {
    setState(() {
      logradouro += resultado.logradouro;
      complemento += resultado.complemento;
      bairro += resultado.bairro;
      localidade += resultado.localidade;
    });
  }

/*
  void mudaParametro() {
    _queryParameters = <String, String>{
      'text': "",
    };
  }
*/
  void answer() {
    setState(() {
      CEP_DIGITADO = entradaTexto.getTextoDigitado();
      //getTextoTraduzido();

      print(CEP_DIGITADO);
      getInformacoes(CEP_DIGITADO);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text("Seja Bem-Vindo ao Buscador de Cep"),
            entradaTexto,
            MeuBotao("Digite seu CEP", answer),
            Text(logradouro),
            Text(complemento),
            Text(bairro),
            Text(localidade),
          ],
        ),
        /*CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 80.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Busca CEP'),
                centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.lightBlueAccent,
                alignment: Alignment.center,
                height: 100,
                child: const Text("Seja Bem-Vindo ao Buscador de Cep"),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                height: 100,
                child: Column(
                  children: <Widget>[
                    entradaTexto,
                    MeuBotao("Digite seu CEP", answer),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.cyan,
                alignment: Alignment.center,
                height: 300,
                child: Column(
                  children: <Widget>[
                    Text(logradouro),
                    Text(complemento),
                    Text(bairro),
                    Text(localidade),
                  ],
                ),
              ),
            ),
          ],
        ),*/
      ),
    );
  }
}

class ConsomeApiApp extends StatefulWidget {
  const ConsomeApiApp({super.key});

  ConsomeApiState createState() {
    return ConsomeApiState();
  }
}
