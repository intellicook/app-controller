//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/set_user_profile_post_request_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/user_profile_veggie_identity_model.dart';
import 'package:app_controller_client/src/model/search_recipes_post_request_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'chat_by_recipe_post_response_model_function_call.g.dart';

/// ChatByRecipePostResponseModelFunctionCall
///
/// Properties:
/// * [veggieIdentity] 
/// * [prefer] 
/// * [dislike] 
/// * [ingredients] 
/// * [extraTerms] 
/// * [page] 
/// * [perPage] 
/// * [includeDetail] 
@BuiltValue()
abstract class ChatByRecipePostResponseModelFunctionCall implements Built<ChatByRecipePostResponseModelFunctionCall, ChatByRecipePostResponseModelFunctionCallBuilder> {
  /// One Of [SearchRecipesPostRequestModel], [SetUserProfilePostRequestModel]
  OneOf get oneOf;

  ChatByRecipePostResponseModelFunctionCall._();

  factory ChatByRecipePostResponseModelFunctionCall([void updates(ChatByRecipePostResponseModelFunctionCallBuilder b)]) = _$ChatByRecipePostResponseModelFunctionCall;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChatByRecipePostResponseModelFunctionCallBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChatByRecipePostResponseModelFunctionCall> get serializer => _$ChatByRecipePostResponseModelFunctionCallSerializer();
}

class _$ChatByRecipePostResponseModelFunctionCallSerializer implements PrimitiveSerializer<ChatByRecipePostResponseModelFunctionCall> {
  @override
  final Iterable<Type> types = const [ChatByRecipePostResponseModelFunctionCall, _$ChatByRecipePostResponseModelFunctionCall];

  @override
  final String wireName = r'ChatByRecipePostResponseModelFunctionCall';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChatByRecipePostResponseModelFunctionCall object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    ChatByRecipePostResponseModelFunctionCall object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value, specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  ChatByRecipePostResponseModelFunctionCall deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChatByRecipePostResponseModelFunctionCallBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [FullType(SetUserProfilePostRequestModel), FullType(SearchRecipesPostRequestModel), ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc, specifiedType: targetType) as OneOf;
    return result.build();
  }
}

