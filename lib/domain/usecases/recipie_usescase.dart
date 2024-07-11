// import 'package:recipie_app/data/repositories/recpipe_repo_impl.y.dart';
// import 'package:recipie_app/domain/enities/recipie_enitity.dart';
// import 'package:recipie_app/domain/respositores/recipe_repo.dart';

// class RecipieUsescase {
//   // create an instance of recipe repo imply

//   RecipeRepo recipeRepo = RecpipeRepoImply();

//   Future<List<RecipeEntity>> getRecipieFromData() async {
//     final recipes = await recipeRepo.getRecipieFromDataSource();
//     return recipes;
//   }
// }

import 'package:recipie_app/domain/enities/recipie_enitity.dart';
import 'package:recipie_app/domain/respositores/recipe_repo.dart';

class RecipeUsecase {
  final RecipeRepo recipeRepository;

  RecipeUsecase({required this.recipeRepository});

  Future<List<RecipeEntity>> getRecipieFromData(String query) async {
    return await recipeRepository.getRecipieFromDataSource(query);
  }
}
