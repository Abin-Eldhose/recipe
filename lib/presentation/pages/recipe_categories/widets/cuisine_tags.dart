import 'package:flutter/material.dart';
import 'package:recipie_app/presentation/core/navigateTo_recipes.dart';

class CuisineTagsWidget extends StatelessWidget {
  const CuisineTagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cuisineTags = [
      'American ',
      'Argentinian ',
      'Australian ',
      'African ',
      'Arabian ',
      'Brazilian ',
      'British ',
      'Caribbean ',
      'Chinese ',
      'French ',
      'German ',
      'Greek ',
      'Indian ',
      'Indonesian ',
      'Irish ',
      'Italian ',
      'Japanese ',
      'Korean ',
      'Malaysian ',
      'Mexican ',
      'Middle Eastern ',
      'Moroccan ',
      'Russian ',
      'Scandinavian ',
      'Spanish ',
      'Thai ',
      'Turkish ',
      'Vietnamese ',
    ];

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Try recipes from around the world",
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              fontSize: w * 0.06),
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Wrap(
          spacing: 5,
          children: cuisineTags.map((cuisine) {
            return ElevatedButton(
                onPressed: () {
                  navigateToRecipesPage(context, cuisine);
                },
                child: Text(cuisine));
          }).toList(),
        )
      ],
    );
  }
}
