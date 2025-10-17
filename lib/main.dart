import 'package:flutter/material.dart';
import 'page_accueil.dart';

void main() {
  runApp(const MonAppli());
}

class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mes Recettes',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const PageAccueil(),
    );
  }
}
