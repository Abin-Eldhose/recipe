import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipie_app/data/repositories/recpipe_repo_impl.y.dart';
import 'package:recipie_app/domain/usecases/recipie_usescase.dart';
import 'package:recipie_app/presentation/constants.dart';
import 'package:recipie_app/presentation/blocs/recipie/bloc/recipie_bloc.dart';
import 'package:recipie_app/presentation/pages/home/widgets/home_appBar.dart';
import 'package:recipie_app/presentation/pages/home/widgets/tab_bar_widget.dart';
import 'package:recipie_app/presentation/pages/home/widgets/text_field-widget.dart';
import 'package:recipie_app/presentation/pages/recipe_categories/categories_page.dart';

import '../../../data/datasources/recipe_remote_dataSource.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RecipieBloc(
        recipeUsecase: RecipeUsecase(
          recipeRepository: RecipeRepositoryImpl(
            recipeRemoteDatasource: RecipeRemoteDataSourceImpl(),
          ),
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeAppbar(),
                  SizedBox(
                    height: size.height * 0.022,
                  ),
                  const TextFieldWidget(),
                  SizedBox(
                    height: size.height * 0.022,
                  ),
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    color: sigInPageBg2, // Set the background color
                    child: SizedBox(
                      height: size.height * 0.25,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Explore the recipes,\ncook the best food \n     at your home",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.05,
                              ),
                            ),
                            Image(
                              image: const AssetImage(cheImage),
                              height: size.height * 0.2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.022,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.05),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoriesPage()));
                          },
                          child: Text(
                            "See all >",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.04),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.022,
                  ),
                  const TabBarWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
