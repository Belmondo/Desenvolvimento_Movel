import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> addUser() async {
    final response = await http.post(
      Uri.parse('https://belmondojr.dev/consulta.php'),
      body: {
        'nome': nomeController.text,
        'cpf': cpfController.text,
        'idade': idadeController.text,
        'email': emailController.text,
      },
    ); // Substitua pela URL da sua API

    if (response.statusCode == 200) {
      // Registro adicionado com sucesso
      Navigator.pop(context);
    } else {
      // Tratamento de erro
      print('Erro ao adicionar o usuário: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome')),
            TextField(
                controller: cpfController,
                decoration: InputDecoration(labelText: 'CPF')),
            TextField(
                controller: idadeController,
                decoration: InputDecoration(labelText: 'Idade')),
            TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addUser,
              child: Text('Adicionar Usuário'),
            ),
          ],
        ),
      ),
    );
  }
}
