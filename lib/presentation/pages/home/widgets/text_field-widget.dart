import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipie_app/presentation/blocs/recipie/bloc/recipie_bloc.dart';
import 'package:recipie_app/presentation/core/navigateTo_recipes.dart';
import 'package:recipie_app/presentation/pages/all_recipes/recipe_by_category.dart';
import 'package:recipie_app/presentation/pages/recipe_categories/item_list.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13), color: Colors.grey[300]),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                    onPressed: () {
                      navigateToRecipesPage(context, searchController.text);
                    },
                    icon: Icon(
                      Icons.search,
                      color: const Color.fromRGBO(10, 10, 10, 1),
                      size: size.width * 0.05,
                    )),
                hintText: "Search what you want to cook",
                hintStyle: TextStyle(
                    fontSize: size.width * 0.04,
                    color: const Color.fromARGB(255, 14, 14, 14)
                        .withOpacity(0.6))),
          ),
        ),
      ),
    );
  }
}
