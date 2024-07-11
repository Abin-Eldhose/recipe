import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipie_app/presentation/blocs/recipie/bloc/recipie_bloc.dart';
import 'package:recipie_app/presentation/constants.dart';
import 'package:recipie_app/presentation/pages/recipe_details/details_page.dart';

class RecipesPageByCategory extends StatelessWidget {
  const RecipesPageByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: BlocBuilder<RecipieBloc, RecipieState>(
          builder: (context, state) {
            print("Current state: $state"); // Debug print
            if (state is RecipieStateLoaded) {
              return Padding(
                  padding: EdgeInsets.only(
                      right: w * 0.04, left: w * 0.04, top: h * 0.04),
                  child: ListView.builder(
                      itemCount: state.recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = state.recipes[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsScreen(recipe: recipe)));
                          },
                          child: Container(
                            width: w,
                            height: h / 3,
                            margin: EdgeInsets.only(bottom: h * 0.03),
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(18),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: recipe.image,
                                      height: h / 3 - 80,
                                      width: w,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.image,
                                        size: h * 0.1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: h * 0.01, left: w * 0.05),
                                      child: Text(
                                        recipe.label,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: h * 0.01, left: w * 0.05),
                                      child: Text(
                                        "Calories : ${recipe.calories.toString()}",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }));
            } else if (state is RecipieInitial) {
              return const Center(
                child: Text("Your recipe will appear here.."),
              );
            } else if (state is RecipieStateLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: sigInPageBg,
                ),
              );
            } else if (state is RecipieStateError) {
              return const Center(
                child: Text("Something went wrong"),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
