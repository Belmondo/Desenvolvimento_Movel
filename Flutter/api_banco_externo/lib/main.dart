import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'add_user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/add_user': (context) => AddUserScreen(),
      },
    );
  }
}
