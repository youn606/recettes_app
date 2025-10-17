import 'package:flutter/material.dart';
import 'recette.dart';

class PageDetails extends StatelessWidget {
  final Recette recette;
  const PageDetails({super.key, required this.recette});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recette.titre)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recette.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ingrédients :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...recette.ingredients.map(
              (ing) => ListTile(
                leading: const Icon(Icons.check),
                title: Text(ing),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
