# app_controller_client.api.RecipeSearchApi

## Load the API package
```dart
import 'package:app_controller_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**recipeSearchAddRecipesPost**](RecipeSearchApi.md#recipesearchaddrecipespost) | **POST** /RecipeSearch/AddRecipes | Add a list of recipes.
[**recipeSearchChatByRecipePost**](RecipeSearchApi.md#recipesearchchatbyrecipepost) | **POST** /RecipeSearch/ChatByRecipe | Chat about a specific recipe.
[**recipeSearchRecipeIdGet**](RecipeSearchApi.md#recipesearchrecipeidget) | **GET** /RecipeSearch/Recipe/{id} | Get recipe by ID.
[**recipeSearchSearchRecipesByIngredientsPost**](RecipeSearchApi.md#recipesearchsearchrecipesbyingredientspost) | **POST** /RecipeSearch/SearchRecipesByIngredients | Search recipes by ingredients.


# **recipeSearchAddRecipesPost**
> AddRecipesPostResponseModel recipeSearchAddRecipesPost(addRecipesPostRequestModel)

Add a list of recipes.

Only admins can add recipes.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getRecipeSearchApi();
final AddRecipesPostRequestModel addRecipesPostRequestModel = ; // AddRecipesPostRequestModel | 

try {
    final response = api.recipeSearchAddRecipesPost(addRecipesPostRequestModel);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RecipeSearchApi->recipeSearchAddRecipesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addRecipesPostRequestModel** | [**AddRecipesPostRequestModel**](AddRecipesPostRequestModel.md)|  | [optional] 

### Return type

[**AddRecipesPostResponseModel**](AddRecipesPostResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recipeSearchChatByRecipePost**
> ChatByRecipePostResponseModel recipeSearchChatByRecipePost(chatByRecipePostRequestModel)

Chat about a specific recipe.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getRecipeSearchApi();
final ChatByRecipePostRequestModel chatByRecipePostRequestModel = ; // ChatByRecipePostRequestModel | 

try {
    final response = api.recipeSearchChatByRecipePost(chatByRecipePostRequestModel);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RecipeSearchApi->recipeSearchChatByRecipePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chatByRecipePostRequestModel** | [**ChatByRecipePostRequestModel**](ChatByRecipePostRequestModel.md)|  | [optional] 

### Return type

[**ChatByRecipePostResponseModel**](ChatByRecipePostResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recipeSearchRecipeIdGet**
> RecipeGetResponseModel recipeSearchRecipeIdGet(id)

Get recipe by ID.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getRecipeSearchApi();
final int id = 56; // int | 

try {
    final response = api.recipeSearchRecipeIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RecipeSearchApi->recipeSearchRecipeIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**RecipeGetResponseModel**](RecipeGetResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recipeSearchSearchRecipesByIngredientsPost**
> SearchRecipesByIngredientsPostResponseModel recipeSearchSearchRecipesByIngredientsPost(searchRecipesByIngredientsPostRequestModel)

Search recipes by ingredients.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getRecipeSearchApi();
final SearchRecipesByIngredientsPostRequestModel searchRecipesByIngredientsPostRequestModel = ; // SearchRecipesByIngredientsPostRequestModel | 

try {
    final response = api.recipeSearchSearchRecipesByIngredientsPost(searchRecipesByIngredientsPostRequestModel);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RecipeSearchApi->recipeSearchSearchRecipesByIngredientsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchRecipesByIngredientsPostRequestModel** | [**SearchRecipesByIngredientsPostRequestModel**](SearchRecipesByIngredientsPostRequestModel.md)|  | [optional] 

### Return type

[**SearchRecipesByIngredientsPostResponseModel**](SearchRecipesByIngredientsPostResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

