import 'package:flutter/material.dart';
import 'package:projeto_meu_widget/CustomButton.dart';
import 'package:projeto_meu_widget/CustomTextField.dart';

main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraAplicacao(),
    );
  }
}

class PrimeiraAplicacao extends StatefulWidget {
  @override
  PrimeiraAplicacaoState createState() {
    return PrimeiraAplicacaoState();
  }
}

class PrimeiraAplicacaoState extends State<PrimeiraAplicacao> {
  String user = "";
  String password = "";
  void login() {
    if (user == 'usuario' && password == 'senha') {
      // Navegar para a próxima tela após o login bem-sucedido (substitua pela sua própria lógica).
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SegundaTela()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.orange),
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Teste"),

              
              CustomTextField.withoutObscure(labelText: "Usuário"),
              CustomTextField.withObscure(
                  labelText: "Usuario", obscureText: true),
             
             
             
              TextField(
                onChanged: (text) {
                  password = text;
                },
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              CustomButton.withIcon(icon: Icons.save, onPressed: login),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: CustomButton(text: "Login", onPressed: login),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
