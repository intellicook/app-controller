# app_controller_client (EXPERIMENTAL)
The controller service that connects backend components and the frontend.

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: v0.1
- Generator version: 7.9.0
- Build package: org.openapitools.codegen.languages.DartDioClientCodegen

## Requirements

* Dart 2.15.0+ or Flutter 2.8.0+
* Dio 5.0.0+ (https://pub.dev/packages/dio)

## Installation & Usage

### pub.dev
To use the package from [pub.dev](https://pub.dev), please include the following in pubspec.yaml
```yaml
dependencies:
  app_controller_client: 1.0.0
```

### Github
If this Dart package is published to Github, please include the following in pubspec.yaml
```yaml
dependencies:
  app_controller_client:
    git:
      url: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
      #ref: main
```

### Local development
To use the package from your local drive, please include the following in pubspec.yaml
```yaml
dependencies:
  app_controller_client:
    path: /path/to/app_controller_client
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:app_controller_client/app_controller_client.dart';


final api = AppControllerClient().getAdminApi();

try {
    final response = await api.adminUsersGet();
    print(response);
} catch on DioException (e) {
    print("Exception when calling AdminApi->adminUsersGet: $e\n");
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
[*AdminApi*](doc/AdminApi.md) | [**adminUsersGet**](doc/AdminApi.md#adminusersget) | **GET** /Admin/Users | Gets a list of all users.
[*AuthApi*](doc/AuthApi.md) | [**authLoginPost**](doc/AuthApi.md#authloginpost) | **POST** /Auth/Login | Logs in a user.
[*AuthApi*](doc/AuthApi.md) | [**authRegisterPost**](doc/AuthApi.md#authregisterpost) | **POST** /Auth/Register | Registers a new user.
[*HealthApi*](doc/HealthApi.md) | [**healthGet**](doc/HealthApi.md#healthget) | **GET** /Health | Checks the health of App Controller and its components.
[*IngredientRecognitionApi*](doc/IngredientRecognitionApi.md) | [**ingredientRecognitionRecognizeIngredientsPost**](doc/IngredientRecognitionApi.md#ingredientrecognitionrecognizeingredientspost) | **POST** /IngredientRecognition/RecognizeIngredients | Recognize ingredients from image.
[*RecipeSearchApi*](doc/RecipeSearchApi.md) | [**recipeSearchAddRecipesPost**](doc/RecipeSearchApi.md#recipesearchaddrecipespost) | **POST** /RecipeSearch/AddRecipes | Add a list of recipes.
[*RecipeSearchApi*](doc/RecipeSearchApi.md) | [**recipeSearchChatByRecipePost**](doc/RecipeSearchApi.md#recipesearchchatbyrecipepost) | **POST** /RecipeSearch/ChatByRecipe | Chat about a specific recipe.
[*RecipeSearchApi*](doc/RecipeSearchApi.md) | [**recipeSearchChatByRecipeStreamPost**](doc/RecipeSearchApi.md#recipesearchchatbyrecipestreampost) | **POST** /RecipeSearch/ChatByRecipe/Stream | Chat about a specific recipe with streaming response.
[*RecipeSearchApi*](doc/RecipeSearchApi.md) | [**recipeSearchRecipeIdGet**](doc/RecipeSearchApi.md#recipesearchrecipeidget) | **GET** /RecipeSearch/Recipe/{id} | Get recipe by ID.
[*RecipeSearchApi*](doc/RecipeSearchApi.md) | [**recipeSearchResetDataDelete**](doc/RecipeSearchApi.md#recipesearchresetdatadelete) | **DELETE** /RecipeSearch/ResetData | Reset all data in the recipe search service, use with caution.
[*RecipeSearchApi*](doc/RecipeSearchApi.md) | [**recipeSearchSearchRecipesPost**](doc/RecipeSearchApi.md#recipesearchsearchrecipespost) | **POST** /RecipeSearch/SearchRecipes | Search for recipes.
[*RecipeSearchApi*](doc/RecipeSearchApi.md) | [**recipeSearchSetUserProfilePost**](doc/RecipeSearchApi.md#recipesearchsetuserprofilepost) | **POST** /RecipeSearch/SetUserProfile | Set user profile.
[*RecipeSearchApi*](doc/RecipeSearchApi.md) | [**recipeSearchUserProfileGet**](doc/RecipeSearchApi.md#recipesearchuserprofileget) | **GET** /RecipeSearch/UserProfile | Get user profile.
[*TemporaryApi*](doc/TemporaryApi.md) | [**apiTemporaryGet**](doc/TemporaryApi.md#apitemporaryget) | **GET** /Api/Temporary | Get method for temporary testing purposes.
[*UserApi*](doc/UserApi.md) | [**userMeDelete**](doc/UserApi.md#usermedelete) | **DELETE** /User/Me | Deletes the current user.
[*UserApi*](doc/UserApi.md) | [**userMeGet**](doc/UserApi.md#usermeget) | **GET** /User/Me | Gets the current user.
[*UserApi*](doc/UserApi.md) | [**userMePasswordPut**](doc/UserApi.md#usermepasswordput) | **PUT** /User/Me/Password | Updates the current user&#39;s password.
[*UserApi*](doc/UserApi.md) | [**userMePut**](doc/UserApi.md#usermeput) | **PUT** /User/Me | Updates the current user.


## Documentation For Models

 - [AddRecipesPostRequestModel](doc/AddRecipesPostRequestModel.md)
 - [AddRecipesPostResponseModel](doc/AddRecipesPostResponseModel.md)
 - [AddRecipesRecipeIngredientModel](doc/AddRecipesRecipeIngredientModel.md)
 - [AddRecipesRequestRecipeModel](doc/AddRecipesRequestRecipeModel.md)
 - [AddRecipesResponseRecipeModel](doc/AddRecipesResponseRecipeModel.md)
 - [AdminUsersGet404Response](doc/AdminUsersGet404Response.md)
 - [ChatByRecipeMessageModel](doc/ChatByRecipeMessageModel.md)
 - [ChatByRecipePostRequestModel](doc/ChatByRecipePostRequestModel.md)
 - [ChatByRecipePostResponseModel](doc/ChatByRecipePostResponseModel.md)
 - [ChatByRecipePostResponseModelFunctionCall](doc/ChatByRecipePostResponseModelFunctionCall.md)
 - [ChatByRecipeRoleModel](doc/ChatByRecipeRoleModel.md)
 - [ChatByRecipeStreamContentModel](doc/ChatByRecipeStreamContentModel.md)
 - [ChatByRecipeStreamHeaderModel](doc/ChatByRecipeStreamHeaderModel.md)
 - [ForbiddenModel](doc/ForbiddenModel.md)
 - [HealthCheckModel](doc/HealthCheckModel.md)
 - [HealthGetResponseModel](doc/HealthGetResponseModel.md)
 - [HealthServiceModel](doc/HealthServiceModel.md)
 - [HealthStatusModel](doc/HealthStatusModel.md)
 - [LoginPostRequestModel](doc/LoginPostRequestModel.md)
 - [LoginPostResponseModel](doc/LoginPostResponseModel.md)
 - [ProblemDetailsModel](doc/ProblemDetailsModel.md)
 - [RecipeGetResponseModel](doc/RecipeGetResponseModel.md)
 - [RecipeNutritionModel](doc/RecipeNutritionModel.md)
 - [RecipeNutritionValueModel](doc/RecipeNutritionValueModel.md)
 - [RecipeRecipeIngredientModel](doc/RecipeRecipeIngredientModel.md)
 - [RecipeSearchChatByRecipeStreamPost200Response](doc/RecipeSearchChatByRecipeStreamPost200Response.md)
 - [RecognizeIngredientsIngredientModel](doc/RecognizeIngredientsIngredientModel.md)
 - [RecognizeIngredientsPostResponseModel](doc/RecognizeIngredientsPostResponseModel.md)
 - [RegisterPostRequestModel](doc/RegisterPostRequestModel.md)
 - [SearchRecipesMatchFieldModel](doc/SearchRecipesMatchFieldModel.md)
 - [SearchRecipesMatchModel](doc/SearchRecipesMatchModel.md)
 - [SearchRecipesPostRequestModel](doc/SearchRecipesPostRequestModel.md)
 - [SearchRecipesPostResponseModel](doc/SearchRecipesPostResponseModel.md)
 - [SearchRecipesRecipeDetailModel](doc/SearchRecipesRecipeDetailModel.md)
 - [SearchRecipesRecipeIngredientModel](doc/SearchRecipesRecipeIngredientModel.md)
 - [SearchRecipesRecipeModel](doc/SearchRecipesRecipeModel.md)
 - [SetUserProfilePostRequestModel](doc/SetUserProfilePostRequestModel.md)
 - [SetUserProfilePostResponseModel](doc/SetUserProfilePostResponseModel.md)
 - [UserGetResponseModel](doc/UserGetResponseModel.md)
 - [UserPasswordPutRequestModel](doc/UserPasswordPutRequestModel.md)
 - [UserProfileGetResponseModel](doc/UserProfileGetResponseModel.md)
 - [UserProfileVeggieIdentityModel](doc/UserProfileVeggieIdentityModel.md)
 - [UserPutRequestModel](doc/UserPutRequestModel.md)
 - [UserPutResponseModel](doc/UserPutResponseModel.md)
 - [UserRoleModel](doc/UserRoleModel.md)
 - [ValidationProblemDetailsModel](doc/ValidationProblemDetailsModel.md)


## Documentation For Authorization


Authentication schemes defined for the API:
### Bearer

- **Type**: HTTP Bearer Token authentication (JWT)


## Author



