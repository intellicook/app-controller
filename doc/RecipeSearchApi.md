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
[**recipeSearchChatByRecipeStreamPost**](RecipeSearchApi.md#recipesearchchatbyrecipestreampost) | **POST** /RecipeSearch/ChatByRecipe/Stream | Chat about a specific recipe with streaming response.
[**recipeSearchFaissIndexThreadGet**](RecipeSearchApi.md#recipesearchfaissindexthreadget) | **GET** /RecipeSearch/FaissIndexThread | Get Faiss index thread status.
[**recipeSearchInitFaissIndexPost**](RecipeSearchApi.md#recipesearchinitfaissindexpost) | **POST** /RecipeSearch/InitFaissIndex | Initialize Faiss index.
[**recipeSearchRecipeIdGet**](RecipeSearchApi.md#recipesearchrecipeidget) | **GET** /RecipeSearch/Recipe/{id} | Get recipe by ID.
[**recipeSearchResetDataDelete**](RecipeSearchApi.md#recipesearchresetdatadelete) | **DELETE** /RecipeSearch/ResetData | Reset all data in the recipe search service, use with caution.
[**recipeSearchSearchRecipesByIngredientsPost**](RecipeSearchApi.md#recipesearchsearchrecipesbyingredientspost) | **POST** /RecipeSearch/SearchRecipesByIngredients | Search recipes by ingredients.
[**recipeSearchSearchRecipesPost**](RecipeSearchApi.md#recipesearchsearchrecipespost) | **POST** /RecipeSearch/SearchRecipes | Search for recipes.


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

# **recipeSearchChatByRecipeStreamPost**
> RecipeSearchChatByRecipeStreamPost200Response recipeSearchChatByRecipeStreamPost(chatByRecipePostRequestModel)

Chat about a specific recipe with streaming response.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getRecipeSearchApi();
final ChatByRecipePostRequestModel chatByRecipePostRequestModel = ; // ChatByRecipePostRequestModel | 

try {
    final response = api.recipeSearchChatByRecipeStreamPost(chatByRecipePostRequestModel);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RecipeSearchApi->recipeSearchChatByRecipeStreamPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **chatByRecipePostRequestModel** | [**ChatByRecipePostRequestModel**](ChatByRecipePostRequestModel.md)|  | [optional] 

### Return type

[**RecipeSearchChatByRecipeStreamPost200Response**](RecipeSearchChatByRecipeStreamPost200Response.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recipeSearchFaissIndexThreadGet**
> FaissIndexThreadGetResponseModel recipeSearchFaissIndexThreadGet()

Get Faiss index thread status.

Only admins can initialize Faiss index.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getRecipeSearchApi();

try {
    final response = api.recipeSearchFaissIndexThreadGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling RecipeSearchApi->recipeSearchFaissIndexThreadGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**FaissIndexThreadGetResponseModel**](FaissIndexThreadGetResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recipeSearchInitFaissIndexPost**
> recipeSearchInitFaissIndexPost(initFaissIndexPostRequestModel)

Initialize Faiss index.

Only admins can initialize Faiss index.  This process is asynchronous, you can check the status of the process using the FaissIndexThread endpoint.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getRecipeSearchApi();
final InitFaissIndexPostRequestModel initFaissIndexPostRequestModel = ; // InitFaissIndexPostRequestModel | 

try {
    api.recipeSearchInitFaissIndexPost(initFaissIndexPostRequestModel);
} catch on DioException (e) {
    print('Exception when calling RecipeSearchApi->recipeSearchInitFaissIndexPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **initFaissIndexPostRequestModel** | [**InitFaissIndexPostRequestModel**](InitFaissIndexPostRequestModel.md)|  | [optional] 

### Return type

void (empty response body)

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

# **recipeSearchResetDataDelete**
> recipeSearchResetDataDelete()

Reset all data in the recipe search service, use with caution.

Only admins can reset data.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getRecipeSearchApi();

try {
    api.recipeSearchResetDataDelete();
} catch on DioException (e) {
    print('Exception when calling RecipeSearchApi->recipeSearchResetDataDelete: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

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

# **recipeSearchSearchRecipesPost**
> SearchRecipesPostResponseModel recipeSearchSearchRecipesPost(searchRecipesPostRequestModel)

Search for recipes.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getRecipeSearchApi();
final SearchRecipesPostRequestModel searchRecipesPostRequestModel = ; // SearchRecipesPostRequestModel | 

try {
    final response = api.recipeSearchSearchRecipesPost(searchRecipesPostRequestModel);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RecipeSearchApi->recipeSearchSearchRecipesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchRecipesPostRequestModel** | [**SearchRecipesPostRequestModel**](SearchRecipesPostRequestModel.md)|  | [optional] 

### Return type

[**SearchRecipesPostResponseModel**](SearchRecipesPostResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
