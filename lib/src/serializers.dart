//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:app_controller_client/src/date_serializer.dart';
import 'package:app_controller_client/src/model/date.dart';

import 'package:app_controller_client/src/model/add_recipes_post_request_model.dart';
import 'package:app_controller_client/src/model/add_recipes_post_response_model.dart';
import 'package:app_controller_client/src/model/add_recipes_recipe_ingredient_model.dart';
import 'package:app_controller_client/src/model/add_recipes_request_recipe_model.dart';
import 'package:app_controller_client/src/model/add_recipes_response_recipe_model.dart';
import 'package:app_controller_client/src/model/admin_users_get404_response.dart';
import 'package:app_controller_client/src/model/chat_by_recipe_message_model.dart';
import 'package:app_controller_client/src/model/chat_by_recipe_post_request_model.dart';
import 'package:app_controller_client/src/model/chat_by_recipe_post_response_model.dart';
import 'package:app_controller_client/src/model/chat_by_recipe_post_response_model_function_call.dart';
import 'package:app_controller_client/src/model/chat_by_recipe_role_model.dart';
import 'package:app_controller_client/src/model/chat_by_recipe_stream_content_model.dart';
import 'package:app_controller_client/src/model/chat_by_recipe_stream_header_model.dart';
import 'package:app_controller_client/src/model/forbidden_model.dart';
import 'package:app_controller_client/src/model/health_check_model.dart';
import 'package:app_controller_client/src/model/health_get_response_model.dart';
import 'package:app_controller_client/src/model/health_service_model.dart';
import 'package:app_controller_client/src/model/health_status_model.dart';
import 'package:app_controller_client/src/model/login_post_request_model.dart';
import 'package:app_controller_client/src/model/login_post_response_model.dart';
import 'package:app_controller_client/src/model/problem_details_model.dart';
import 'package:app_controller_client/src/model/recipe_get_response_model.dart';
import 'package:app_controller_client/src/model/recipe_nutrition_model.dart';
import 'package:app_controller_client/src/model/recipe_nutrition_value_model.dart';
import 'package:app_controller_client/src/model/recipe_recipe_ingredient_model.dart';
import 'package:app_controller_client/src/model/recipe_search_chat_by_recipe_stream_post200_response.dart';
import 'package:app_controller_client/src/model/recognize_ingredients_ingredient_model.dart';
import 'package:app_controller_client/src/model/recognize_ingredients_post_response_model.dart';
import 'package:app_controller_client/src/model/register_post_request_model.dart';
import 'package:app_controller_client/src/model/search_recipes_match_field_model.dart';
import 'package:app_controller_client/src/model/search_recipes_match_model.dart';
import 'package:app_controller_client/src/model/search_recipes_post_request_model.dart';
import 'package:app_controller_client/src/model/search_recipes_post_response_model.dart';
import 'package:app_controller_client/src/model/search_recipes_recipe_detail_model.dart';
import 'package:app_controller_client/src/model/search_recipes_recipe_ingredient_model.dart';
import 'package:app_controller_client/src/model/search_recipes_recipe_model.dart';
import 'package:app_controller_client/src/model/set_user_profile_post_request_model.dart';
import 'package:app_controller_client/src/model/set_user_profile_post_response_model.dart';
import 'package:app_controller_client/src/model/user_get_response_model.dart';
import 'package:app_controller_client/src/model/user_password_put_request_model.dart';
import 'package:app_controller_client/src/model/user_profile_get_response_model.dart';
import 'package:app_controller_client/src/model/user_profile_veggie_identity_model.dart';
import 'package:app_controller_client/src/model/user_put_request_model.dart';
import 'package:app_controller_client/src/model/user_put_response_model.dart';
import 'package:app_controller_client/src/model/user_role_model.dart';
import 'package:app_controller_client/src/model/validation_problem_details_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  AddRecipesPostRequestModel,
  AddRecipesPostResponseModel,
  AddRecipesRecipeIngredientModel,
  AddRecipesRequestRecipeModel,
  AddRecipesResponseRecipeModel,
  AdminUsersGet404Response,
  ChatByRecipeMessageModel,
  ChatByRecipePostRequestModel,
  ChatByRecipePostResponseModel,
  ChatByRecipePostResponseModelFunctionCall,
  ChatByRecipeRoleModel,
  ChatByRecipeStreamContentModel,
  ChatByRecipeStreamHeaderModel,
  ForbiddenModel,
  HealthCheckModel,
  HealthGetResponseModel,
  HealthServiceModel,
  HealthStatusModel,
  LoginPostRequestModel,
  LoginPostResponseModel,
  ProblemDetailsModel,$ProblemDetailsModel,
  RecipeGetResponseModel,
  RecipeNutritionModel,
  RecipeNutritionValueModel,
  RecipeRecipeIngredientModel,
  RecipeSearchChatByRecipeStreamPost200Response,
  RecognizeIngredientsIngredientModel,
  RecognizeIngredientsPostResponseModel,
  RegisterPostRequestModel,
  SearchRecipesMatchFieldModel,
  SearchRecipesMatchModel,
  SearchRecipesPostRequestModel,
  SearchRecipesPostResponseModel,
  SearchRecipesRecipeDetailModel,
  SearchRecipesRecipeIngredientModel,
  SearchRecipesRecipeModel,
  SetUserProfilePostRequestModel,
  SetUserProfilePostResponseModel,
  UserGetResponseModel,
  UserPasswordPutRequestModel,
  UserProfileGetResponseModel,
  UserProfileVeggieIdentityModel,
  UserPutRequestModel,
  UserPutResponseModel,
  UserRoleModel,
  ValidationProblemDetailsModel,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(HealthGetResponseModel)]),
        () => ListBuilder<HealthGetResponseModel>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UserGetResponseModel)]),
        () => ListBuilder<UserGetResponseModel>(),
      )
      ..add(ProblemDetailsModel.serializer)
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
