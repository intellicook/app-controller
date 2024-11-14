//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/chat_by_recipe_role_model.dart';
import 'package:app_controller_client/src/model/chat_by_recipe_stream_header_model.dart';
import 'package:app_controller_client/src/model/chat_by_recipe_stream_content_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'recipe_search_chat_by_recipe_stream_post200_response.g.dart';

/// RecipeSearchChatByRecipeStreamPost200Response
///
/// Properties:
/// * [text] 
/// * [role] 
@BuiltValue()
abstract class RecipeSearchChatByRecipeStreamPost200Response implements Built<RecipeSearchChatByRecipeStreamPost200Response, RecipeSearchChatByRecipeStreamPost200ResponseBuilder> {
  /// One Of [ChatByRecipeStreamContentModel], [ChatByRecipeStreamHeaderModel]
  OneOf get oneOf;

  RecipeSearchChatByRecipeStreamPost200Response._();

  factory RecipeSearchChatByRecipeStreamPost200Response([void updates(RecipeSearchChatByRecipeStreamPost200ResponseBuilder b)]) = _$RecipeSearchChatByRecipeStreamPost200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecipeSearchChatByRecipeStreamPost200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecipeSearchChatByRecipeStreamPost200Response> get serializer => _$RecipeSearchChatByRecipeStreamPost200ResponseSerializer();
}

class _$RecipeSearchChatByRecipeStreamPost200ResponseSerializer implements PrimitiveSerializer<RecipeSearchChatByRecipeStreamPost200Response> {
  @override
  final Iterable<Type> types = const [RecipeSearchChatByRecipeStreamPost200Response, _$RecipeSearchChatByRecipeStreamPost200Response];

  @override
  final String wireName = r'RecipeSearchChatByRecipeStreamPost200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecipeSearchChatByRecipeStreamPost200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    RecipeSearchChatByRecipeStreamPost200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value, specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  RecipeSearchChatByRecipeStreamPost200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecipeSearchChatByRecipeStreamPost200ResponseBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [FullType(ChatByRecipeStreamContentModel), FullType(ChatByRecipeStreamHeaderModel), ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc, specifiedType: targetType) as OneOf;
    return result.build();
  }
}

