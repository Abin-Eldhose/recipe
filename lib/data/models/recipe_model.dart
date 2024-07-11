import 'package:recipie_app/domain/enities/recipie_enitity.dart';

class RecipeModel {
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

  RecipeModel({
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

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      uri: json['uri'],
      label: json['label'],
      image: json['image'],
      source: json['source'],
      url: json['url'],
      calories: (json['calories'] as num).toInt(),
      totalWeight: (json['totalWeight'] as num).toDouble(),
      ingredientLines: List<String>.from(json['ingredientLines']),
      healthLabels: List<String>.from(json['healthLabels']),
      ingredients: List<Map<String, dynamic>>.from(json['ingredients']),
      totalTime: (json['totalTime'] as num).toInt(),
    );
  }

  RecipeEntity toEntity() {
    return RecipeEntity(
      uri: uri,
      label: label,
      image: image,
      source: source,
      url: url,
      calories: calories,
      totalWeight: totalWeight,
      ingredientLines: ingredientLines,
      healthLabels: healthLabels,
      ingredients: ingredients,
      totalTime: totalTime,
    );
  }
}
