//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/validation_problem_details_model.dart';
import 'package:app_controller_client/src/model/problem_details_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'recipe_search_add_recipes_post404_response.g.dart';

/// RecipeSearchAddRecipesPost404Response
///
/// Properties:
/// * [type] 
/// * [title] 
/// * [status] 
/// * [detail] 
/// * [instance] 
/// * [traceId] 
/// * [errors] 
@BuiltValue()
abstract class RecipeSearchAddRecipesPost404Response implements Built<RecipeSearchAddRecipesPost404Response, RecipeSearchAddRecipesPost404ResponseBuilder> {
  /// One Of [ProblemDetailsModel], [ValidationProblemDetailsModel]
  OneOf get oneOf;

  RecipeSearchAddRecipesPost404Response._();

  factory RecipeSearchAddRecipesPost404Response([void updates(RecipeSearchAddRecipesPost404ResponseBuilder b)]) = _$RecipeSearchAddRecipesPost404Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecipeSearchAddRecipesPost404ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecipeSearchAddRecipesPost404Response> get serializer => _$RecipeSearchAddRecipesPost404ResponseSerializer();
}

class _$RecipeSearchAddRecipesPost404ResponseSerializer implements PrimitiveSerializer<RecipeSearchAddRecipesPost404Response> {
  @override
  final Iterable<Type> types = const [RecipeSearchAddRecipesPost404Response, _$RecipeSearchAddRecipesPost404Response];

  @override
  final String wireName = r'RecipeSearchAddRecipesPost404Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecipeSearchAddRecipesPost404Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    RecipeSearchAddRecipesPost404Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value, specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  RecipeSearchAddRecipesPost404Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecipeSearchAddRecipesPost404ResponseBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [FullType(ProblemDetailsModel), FullType(ValidationProblemDetailsModel), ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc, specifiedType: targetType) as OneOf;
    return result.build();
  }
}

