import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipie_app/presentation/blocs/recipie/bloc/recipie_bloc.dart';
import 'package:recipie_app/presentation/pages/all_recipes/recipe_by_category.dart';

void navigateToRecipesPage(BuildContext context, String selectedCategory) {
  print("Category selected: $selectedCategory"); // Debug print

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: BlocProvider.of<RecipieBloc>(context)
          ..add(RecipieRequestEvent(query: selectedCategory)),
        child: RecipesPageByCategory(),
      ),
    ),
  );
}
