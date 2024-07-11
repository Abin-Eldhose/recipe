import 'package:flutter/material.dart';
// import 'package:recipie_app/data/models/recipe_model.dart';
import 'package:recipie_app/domain/enities/recipie_enitity.dart'; // Adjust import path as per your project structure

class RecipeItem extends StatelessWidget {
  final RecipeEntity recipe;

  const RecipeItem({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkResponse(
              onTap: () {
                // Navigate to recipe details page or handle tap event
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    recipe
                        .image, // Example: recipe.image is the URL of the recipe image
                    height: h * .17,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.013),
            Text(
              recipe
                  .label, // Example: recipe.label is the title/name of the recipe
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: h * 0.01),
            Text(
              "Calories : ${recipe.calories.toString()}",
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
