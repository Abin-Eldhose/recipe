import 'package:flutter/material.dart';
import 'package:recipie_app/presentation/pages/recipe_details/widgets/ingredient_item_widget.dart';

class IngredientListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> ingredients;

  const IngredientListWidget({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = ingredients[index];
        final quantity = ingredient['quantity'] ?? 1;
        final measure = ingredient['measure'] ?? '';
        final food = ingredient['food'] ?? '';
        final image = ingredient['image'] ?? '';

        return IngredientItemWidget(
          key: Key(index.toString()), // Provide a unique key if needed
          quantity: quantity,
          measure: measure,
          food: food,
          image: image,
        );
      },
    );
  }
}
