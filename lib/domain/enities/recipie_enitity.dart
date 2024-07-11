class RecipeEntity {
  final String uri;
  final String label;
  final String image;
  final String source;
  final String url;
  final int calories;
  final double totalWeight;
  final List<String> ingredientLines;
  final List<String> healthLabels;
  final List<Map<String, dynamic>> ingredients;
  final int totalTime;

  RecipeEntity({
    required this.uri,
    required this.label,
    required this.image,
    required this.source,
    required this.url,
    required this.calories,
    required this.totalWeight,
    required this.ingredientLines,
    required this.healthLabels,
    required this.ingredients,
    required this.totalTime,
  });

  List<Object> get props => [
        uri,
        label,
        image,
        source,
        url,
        calories,
        totalWeight,
        ingredientLines,
        healthLabels,
        ingredients,
        totalTime,
      ];

  @override
  // ignore: override_on_non_overriding_member
  bool get stringify => true;
}
