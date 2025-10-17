class Recette {
  String titre;
  String description;
  List<String> ingredients;
  bool favori;

  Recette({
    required this.titre,
    required this.description,
    required this.ingredients,
    this.favori = false,
  });
}
