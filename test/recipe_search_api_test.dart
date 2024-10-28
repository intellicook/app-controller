import 'package:test/test.dart';
import 'package:app_controller_client/app_controller_client.dart';


/// tests for RecipeSearchApi
void main() {
  final instance = AppControllerClient().getRecipeSearchApi();

  group(RecipeSearchApi, () {
    // Search recipes by ingredients.
    //
    //Future<SearchRecipesByIngredientsPostResponseModel> recipeSearchSearchRecipesByIngredientsPost({ SearchRecipesByIngredientsPostRequestModel searchRecipesByIngredientsPostRequestModel }) async
    test('test recipeSearchSearchRecipesByIngredientsPost', () async {
      // TODO
    });

  });
}
