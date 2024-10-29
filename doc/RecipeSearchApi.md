# app_controller_client.api.RecipeSearchApi

## Load the API package
```dart
import 'package:app_controller_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**recipeSearchRecipeIdGet**](RecipeSearchApi.md#recipesearchrecipeidget) | **GET** /RecipeSearch/Recipe/{id} | Get recipe by ID.
[**recipeSearchSearchRecipesByIngredientsPost**](RecipeSearchApi.md#recipesearchsearchrecipesbyingredientspost) | **POST** /RecipeSearch/SearchRecipesByIngredients | Search recipes by ingredients.


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

