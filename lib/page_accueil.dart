import 'package:flutter/material.dart';
import 'recette.dart';
import 'page_ajout.dart';
import 'page_details.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  List<Recette> recettes = [
    Recette(
      titre: 'Pâtes à la carbonara',
      description: 'Une recette italienne rapide et délicieuse.',
      ingredients: ['Pâtes', 'Œufs', 'Lardons', 'Parmesan'],
    ),
    Recette(
      titre: 'Salade de poulet',
      description: 'Une salade simple et fraîche pour l’été.',
      ingredients: ['Poulet', 'Salade', 'Tomates', 'Vinaigrette'],
    ),
  ];

  void ajouterRecette(Recette nouvelleRecette) {
    setState(() {
      recettes.add(nouvelleRecette);
    });
  }

  void changerFavori(Recette recette) {
    setState(() {
      recette.favori = !recette.favori;
    });
  }

  void supprimerRecette(Recette recette) {
    setState(() {
      recettes.remove(recette);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Recettes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: recettes.length,
        itemBuilder: (context, index) {
          final recette = recettes[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(recette.titre),
              subtitle: Text(recette.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      recette.favori
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: recette.favori ? Colors.red : null,
                    ),
                    onPressed: () => changerFavori(recette),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => supprimerRecette(recette),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PageDetails(recette: recette),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nouvelleRecette = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PageAjout()),
          );
          if (nouvelleRecette != null) {
            ajouterRecette(nouvelleRecette);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
