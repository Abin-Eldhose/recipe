import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:recipie_app/presentation/constants.dart';
import 'package:recipie_app/presentation/core/navigateTo_recipes.dart';
import 'package:recipie_app/presentation/pages/home/widgets/text_field-widget.dart';

import 'package:recipie_app/presentation/pages/recipe_categories/item_list.dart';
import 'package:recipie_app/presentation/pages/recipe_categories/widets/cuisine_tags.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: sigInPageBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: TextFieldWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              right: w * 0.04, left: w * 0.04, bottom: h * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.04),
              CuisineTagsWidget(),
              SizedBox(height: h * 0.06),
              Text(
                "For you...",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: w * 0.06,
                ),
              ),
              SizedBox(height: h * 0.01),
              GridView.builder(
                shrinkWrap: true, // Add shrinkWrap: true
                physics:
                    NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                itemCount: catLabels.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: h * 0.025,
                  mainAxisSpacing: w * 0.02,
                ),
                itemBuilder: (context, index) {
                  return Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        navigateToRecipesPage(context, catLabels[index]);
                      },
                      child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: h * 0.064,
                                child: Image.asset(Catimages[index]),
                              ),
                              SizedBox(height: h * 0.001),
                              Text(
                                catLabels[index],
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
