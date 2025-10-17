import 'package:flutter/material.dart';
import 'recette.dart';

class PageAjout extends StatefulWidget {
  const PageAjout({super.key});

  @override
  State<PageAjout> createState() => _PageAjoutState();
}

class _PageAjoutState extends State<PageAjout> {
  final _formulaire = GlobalKey<FormState>();
  String titre = '';
  String description = '';
  String texteIngredients = '';

  void enregistrer() {
    if (_formulaire.currentState!.validate()) {
      _formulaire.currentState!.save();

      final recette = Recette(
        titre: titre,
        description: description,
        ingredients:
            texteIngredients.split(',').map((e) => e.trim()).toList(),
      );

      Navigator.pop(context, recette);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une recette')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formulaire,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Titre'),
                validator: (val) =>
                    val!.isEmpty ? 'Entrez un titre' : null,
                onSaved: (val) => titre = val!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (val) =>
                    val!.isEmpty ? 'Entrez une description' : null,
                onSaved: (val) => description = val!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ingrédients (séparés par des virgules)',
                ),
                validator: (val) =>
                    val!.isEmpty ? 'Entrez les ingrédients' : null,
                onSaved: (val) => texteIngredients = val!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: enregistrer,
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
