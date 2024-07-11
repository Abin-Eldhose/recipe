import 'package:hive/hive.dart';
import 'package:recipie_app/domain/enities/recipie_enitity.dart';

part 'save_recipe_model.g.dart';

@HiveType(typeId: 0)
class RecipeHiveModel extends HiveObject {
  @HiveField(0)
  final String uri;
  @HiveField(1)
  final String label;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String source;
  @HiveField(4)
  final String url;
  @HiveField(5)
  final int calories;
  @HiveField(6)
  final double totalWeight;
  @HiveField(7)
  final List<String> ingredientLines;
  @HiveField(8)
  final List<String> healthLabels;
  @HiveField(9)
  final List<Map<String, dynamic>> ingredients;
  @HiveField(10)
  final int totalTime;

  RecipeHiveModel({
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

  factory RecipeHiveModel.fromEntity(RecipeEntity entity) {
    return RecipeHiveModel(
      uri: entity.uri,
      label: entity.label,
      image: entity.image,
      source: entity.source,
      url: entity.url,
      calories: entity.calories,
      totalWeight: entity.totalWeight,
      ingredientLines: entity.ingredientLines,
      healthLabels: entity.healthLabels,
      ingredients: entity.ingredients,
      totalTime: entity.totalTime,
    );
  }
}
