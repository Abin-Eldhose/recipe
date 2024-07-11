import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipie_app/data/models/recipe_model.dart';

abstract class RecipeRemoteDatasource {
  Future<List<RecipeModel>> getRecipieFromAPI(String query);
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDatasource {
  static const String _appId = 'e3aa995c';
  static const String _appKey = 'ac1e2abab005593e34423ae6db044bb0';
  static const String _baseUrl = 'https://api.edamam.com/search';

  final http.Client client = http.Client();

  @override
  Future<List<RecipeModel>> getRecipieFromAPI(String query) async {
    try {
      final response = await client.get(
        Uri.parse(
            '$_baseUrl?q=$query&app_id=$_appId&app_key=$_appKey&from=0&to=3&calories=591-722&health=alcohol-free'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (responseBody.containsKey('hits')) {
          final List<dynamic> hits = responseBody['hits'];
          final List<RecipeModel> recipes =
              hits.map((hit) => RecipeModel.fromJson(hit['recipe'])).toList();
          return recipes;
        } else {
          throw Exception('Failed to fetch recipes');
        }
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
}
