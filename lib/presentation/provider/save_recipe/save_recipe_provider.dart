import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipie_app/data/models/save_recipe_model.dart';

class SaveRecipeProvider extends ChangeNotifier {
  Box<RecipeHiveModel>? _recipeBox;

  SaveRecipeProvider() {
    _init();
  }

  Future<void> _init() async {
    await Hive.openBox<RecipeHiveModel>('recipes');
    _recipeBox = Hive.box<RecipeHiveModel>('recipes');
    notifyListeners();
  }

  void saveRecipe(RecipeHiveModel recipe) {
    _recipeBox!.add(recipe);
    notifyListeners();
  }

  void deleteRecipe(int key) {
    _recipeBox!.delete(key);
    notifyListeners();
  }

  List<RecipeHiveModel> get savedRecipes => _recipeBox!.values.toList();
}
