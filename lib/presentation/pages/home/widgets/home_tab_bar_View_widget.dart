import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipie_app/presentation/blocs/recipie/bloc/recipie_bloc.dart';
import 'package:recipie_app/presentation/pages/recipe_details/details_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeTabBarViewWidget extends StatelessWidget {
  const HomeTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<RecipieBloc, RecipieState>(
      builder: (context, state) {
        if (state is RecipieStateLoaded) {
          return SizedBox(
            height: size.height * .28,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final recipe = state.recipes[index];
                return Container(
                  margin: EdgeInsets.only(right: size.width * 0.02),
                  width: size.width * 0.5,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkResponse(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(recipe: recipe),
                                ),
                              );
                            },
                            child: Material(
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(15),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: recipe.image,
                                    height: size.height * .17,
                                    width: size.width,
                                    fit: BoxFit.fill,
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.image),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.013,
                          ),
                          Text(
                            recipe.label,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, letterSpacing: 1),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "Calories : ${recipe.calories.toString()}",
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 15,
                );
              },
              itemCount: state.recipes.length,
            ),
          );
        } else if (state is RecipieStateLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RecipieStateError) {
          return const Center(child: Text('Failed to load recipes'));
        } else {
          return const Center(child: Text('Please select a category'));
        }
      },
    );
  }
}
