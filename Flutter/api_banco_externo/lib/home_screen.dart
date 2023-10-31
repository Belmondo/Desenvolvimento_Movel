import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://belmondojr.dev/consulta.php?action=listar')); // Substitua pela URL da sua API

    if (response.statusCode == 200) {
      setState(() {
        users = json.decode(response.body);
        print(users);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text('Nome: ${user['nome']}'),
            subtitle: Text('CPF: ${user['cpf']}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add_user');
          setState(() {
            fetchData();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
