import 'package:recipie_app/data/datasources/recipe_remote_dataSource.dart';
import 'package:recipie_app/domain/enities/recipie_enitity.dart';
import 'package:recipie_app/domain/respositores/recipe_repo.dart';

class RecipeRepositoryImpl implements RecipeRepo {
  final RecipeRemoteDatasource recipeRemoteDatasource;

  RecipeRepositoryImpl({required this.recipeRemoteDatasource});

  @override
  Future<List<RecipeEntity>> getRecipieFromDataSource(String query) async {
    final recipes = await recipeRemoteDatasource.getRecipieFromAPI(query);
    return recipes.map((recipe) => recipe.toEntity()).toList();
  }
}
