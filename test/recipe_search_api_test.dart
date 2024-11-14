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

    // Get Faiss index thread status.
    //
    // Only admins can initialize Faiss index.
    //
    //Future<FaissIndexThreadGetResponseModel> recipeSearchFaissIndexThreadGet() async
    test('test recipeSearchFaissIndexThreadGet', () async {
      // TODO
    });

    // Initialize Faiss index.
    //
    // Only admins can initialize Faiss index.  This process is asynchronous, you can check the status of the process using the FaissIndexThread endpoint.
    //
    //Future recipeSearchInitFaissIndexPost({ InitFaissIndexPostRequestModel initFaissIndexPostRequestModel }) async
    test('test recipeSearchInitFaissIndexPost', () async {
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

    // Search recipes by ingredients.
    //
    //Future<SearchRecipesByIngredientsPostResponseModel> recipeSearchSearchRecipesByIngredientsPost({ SearchRecipesByIngredientsPostRequestModel searchRecipesByIngredientsPostRequestModel }) async
    test('test recipeSearchSearchRecipesByIngredientsPost', () async {
      // TODO
    });

    // Search for recipes.
    //
    //Future<SearchRecipesPostResponseModel> recipeSearchSearchRecipesPost({ SearchRecipesPostRequestModel searchRecipesPostRequestModel }) async
    test('test recipeSearchSearchRecipesPost', () async {
      // TODO
    });

  });
}
