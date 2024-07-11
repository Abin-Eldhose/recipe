// import 'package:recipie_app/domain/enities/recipie_enitity.dart';

// abstract class RecipeRepo {
//   Future<List<RecipeEntity>> getRecipieFromDataSource();
// }

import 'package:recipie_app/domain/enities/recipie_enitity.dart';

abstract class RecipeRepo {
  Future<List<RecipeEntity>> getRecipieFromDataSource(String query);
}
