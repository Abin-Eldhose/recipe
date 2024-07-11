import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipie_app/data/models/save_recipe_model.dart';
import 'package:recipie_app/domain/enities/recipie_enitity.dart';
import 'package:recipie_app/presentation/constants.dart';
import 'package:recipie_app/presentation/core/details_dialog.dart';
import 'package:recipie_app/presentation/core/share_recipe.dart';
import 'package:recipie_app/presentation/core/start_cooking.dart';
import 'package:recipie_app/presentation/pages/recipe_details/widgets/circle_button_widget.dart';
import 'package:recipie_app/presentation/pages/recipe_details/widgets/custom_clip_path.dart';
import 'package:recipie_app/presentation/pages/recipe_details/widgets/ingredient_list_widget.dart';
import 'package:recipie_app/presentation/pages/saved_recipe/saved_recipes_page.dart';
import 'package:recipie_app/presentation/provider/save_recipe/save_recipe_provider.dart';

class DetailsScreen extends StatelessWidget {
  final RecipeEntity recipe;

  const DetailsScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final saveRecipeProvider = Provider.of<SaveRecipeProvider>(context);

    return Scaffold(
      backgroundColor: sigInPageBg2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Material(
                  elevation: 15,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: size.height * 0.44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(recipe.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.04,
                  left: size.width * 0.04,
                  child: const CircleAvatar(
                    backgroundColor: sigInPageBg,
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    recipe.label,
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      wordSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    "Calories - ${recipe.calories.toString()} ",
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          shareRecipe(recipe.url);
                        },
                        child: GestureDetector(
                          onTap: () {
                            shareRecipe(recipe.url);
                          },
                          child: CircleButtonWidget(
                            icon: Icons.share,
                            label: "Share",
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final recipeModel =
                              RecipeHiveModel.fromEntity(recipe);
                          saveRecipeProvider.saveRecipe(recipeModel);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Recipe saved'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: CircleButtonWidget(
                          icon: Icons.bookmark_border_outlined,
                          label: "Save",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ShowUnitChart.showChart(context);
                        },
                        child: CircleButtonWidget(
                          icon: Icons.table_chart_outlined,
                          label: "Unit chart",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width * 0.44,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SavedRecipesPage()));
                          },
                          child: const Text(
                            "Saved Recipes",
                            style: TextStyle(color: sigInPageBg),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.34,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: sigInPageBg),
                          onPressed: () {
                            StartCooking().startCooking(recipe.url);
                          },
                          child: const Text(
                            "Start",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    height: size.height * 0.07,
                    width: size.width,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipPath(
                            clipper: CustomClipPath(),
                            child: Container(
                              color: Colors.red,
                              child: Center(
                                child: Text(
                                  "Ingredients required",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: size.width * 0.05,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              "   ${recipe.ingredients.length.toString()}\n items",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(
                    height: size.height * 1.8,
                    child: IngredientListWidget(
                      ingredients: recipe.ingredients,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
