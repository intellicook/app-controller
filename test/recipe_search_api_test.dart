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

    // Chat about a specific recipe with streaming response.
    //
    //Future<RecipeSearchChatByRecipeStreamPost200Response> recipeSearchChatByRecipeStreamPost({ ChatByRecipePostRequestModel chatByRecipePostRequestModel }) async
    test('test recipeSearchChatByRecipeStreamPost', () async {
      // TODO
    });

    // Get recipe by ID.
    //
    //Future<RecipeGetResponseModel> recipeSearchRecipeIdGet(int id) async
    test('test recipeSearchRecipeIdGet', () async {
      // TODO
    });

    // Reset all data in the recipe search service, use with caution.
    //
    // Only admins can reset data.
    //
    //Future recipeSearchResetDataDelete() async
    test('test recipeSearchResetDataDelete', () async {
      // TODO
    });

    // Search for recipes.
    //
    //Future<SearchRecipesPostResponseModel> recipeSearchSearchRecipesPost({ SearchRecipesPostRequestModel searchRecipesPostRequestModel }) async
    test('test recipeSearchSearchRecipesPost', () async {
      // TODO
    });

    // Set user profile.
    //
    //Future<SetUserProfilePostResponseModel> recipeSearchSetUserProfilePost({ SetUserProfilePostRequestModel setUserProfilePostRequestModel }) async
    test('test recipeSearchSetUserProfilePost', () async {
      // TODO
    });

    // Get user profile.
    //
    //Future<UserProfileGetResponseModel> recipeSearchUserProfileGet() async
    test('test recipeSearchUserProfileGet', () async {
      // TODO
    });

  });
}
