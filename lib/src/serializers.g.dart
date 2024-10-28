// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(HealthCheckModel.serializer)
      ..add(HealthGetResponseModel.serializer)
      ..add(HealthServiceModel.serializer)
      ..add(HealthStatusModel.serializer)
      ..add(LoginPostRequestModel.serializer)
      ..add(LoginPostResponseModel.serializer)
      ..add(ProblemDetails.serializer)
      ..add(RegisterPostRequestModel.serializer)
      ..add(SearchRecipesByIngredientsPostRequestModel.serializer)
      ..add(SearchRecipesByIngredientsPostResponseModel.serializer)
      ..add(SearchRecipesByIngredientsRecipeModel.serializer)
      ..add(UserGetResponseModel.serializer)
      ..add(UserPasswordPutRequestModel.serializer)
      ..add(UserPutRequestModel.serializer)
      ..add(UserPutResponseModel.serializer)
      ..add(UserRoleModel.serializer)
      ..add(ValidationProblemDetails.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(HealthCheckModel)]),
          () => new ListBuilder<HealthCheckModel>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(SearchRecipesByIngredientsRecipeModel)]),
          () => new ListBuilder<SearchRecipesByIngredientsRecipeModel>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(BuiltList, const [const FullType(String)])
          ]),
          () => new MapBuilder<String, BuiltList<String>>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
