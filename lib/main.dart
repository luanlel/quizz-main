import 'package:flutter/material.dart';
import 'tela_inicial.dart';

void main() => runApp(MenuApp());

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: TelaInicial(),
      debugShowCheckedModeBanner: false,
    );
  }
}