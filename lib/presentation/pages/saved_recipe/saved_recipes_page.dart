import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipie_app/data/models/save_recipe_model.dart';
import 'package:recipie_app/presentation/constants.dart';
import 'package:recipie_app/presentation/core/start_cooking.dart';
import 'package:recipie_app/presentation/provider/save_recipe/save_recipe_provider.dart';

class SavedRecipesPage extends StatelessWidget {
  const SavedRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Saved Recipes',
          style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: sigInPageBg,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: Hive.openBox<RecipeHiveModel>('recipes'),
        builder: (BuildContext context,
            AsyncSnapshot<Box<RecipeHiveModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final recipesBox = snapshot.data!;
              return ListView.builder(
                itemCount: recipesBox.length,
                itemBuilder: (BuildContext context, int index) {
                  RecipeHiveModel recipe = recipesBox.getAt(index)!;
                  return RecipeListItem(
                      recipe: recipe, recipeKey: recipesBox.keyAt(index));
                },
              );
            } else {
              return const Center(
                child: Text('No recipes saved yet.'),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class RecipeListItem extends StatelessWidget {
  final RecipeHiveModel recipe;
  final int recipeKey;

  const RecipeListItem(
      {Key? key, required this.recipe, required this.recipeKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final saveRecipeProvider = Provider.of<SaveRecipeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: const Color.fromARGB(255, 253, 167, 167),
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: 100,
              height: 100,
              child: Image.network(
                recipe.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Calories: ${recipe.calories}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          trailing: PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'startCooking',
                child: Row(
                  children: [
                    Icon(Icons.play_arrow, color: Colors.red),
                    SizedBox(width: 8.0),
                    Text('Start Cooking'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 8.0),
                    Text('Delete'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'startCooking') {
                StartCooking().startCooking(recipe.url);
              } else if (value == 'delete') {
                saveRecipeProvider.deleteRecipe(recipeKey);
              }
            },
          ),
        ),
      ),
    );
  }
}
