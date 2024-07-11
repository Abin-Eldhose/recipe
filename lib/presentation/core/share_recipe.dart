import 'package:share_plus/share_plus.dart';

void shareRecipe(String recipeLink) {
  final message = 'Check out this recipe: $recipeLink';
  Share.share(message);
}
