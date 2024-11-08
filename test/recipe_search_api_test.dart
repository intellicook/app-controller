import 'package:test/test.dart';
import 'package:app_controller_client/app_controller_client.dart';


/// tests for RecipeSearchApi
void main() {
  final instance = AppControllerClient().getRecipeSearchApi();

  group(RecipeSearchApi, () {
    // Add a list of recipes.
    //
    // Only admins can add recipes.
    //
    //Future<AddRecipesPostResponseModel> recipeSearchAddRecipesPost({ AddRecipesPostRequestModel addRecipesPostRequestModel }) async
    test('test recipeSearchAddRecipesPost', () async {
      // TODO
    });

    // Chat about a specific recipe.
    //
    //Future<ChatByRecipePostResponseModel> recipeSearchChatByRecipePost({ ChatByRecipePostRequestModel chatByRecipePostRequestModel }) async
    test('test recipeSearchChatByRecipePost', () async {
      // TODO
    });

    // Get recipe by ID.
    //
    //Future<RecipeGetResponseModel> recipeSearchRecipeIdGet(int id) async
    test('test recipeSearchRecipeIdGet', () async {
      // TODO
    });

    // Search recipes by ingredients.
    //
    //Future<SearchRecipesByIngredientsPostResponseModel> recipeSearchSearchRecipesByIngredientsPost({ SearchRecipesByIngredientsPostRequestModel searchRecipesByIngredientsPostRequestModel }) async
    test('test recipeSearchSearchRecipesByIngredientsPost', () async {
      // TODO
    });

  });
}
