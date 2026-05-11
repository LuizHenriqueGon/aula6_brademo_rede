// Arquivo: lib/main.dart
import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Importando a tela principal

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula 6 (BRADEMO) - Rede',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(), // Carrega a interface que construímos
    );
  }
}