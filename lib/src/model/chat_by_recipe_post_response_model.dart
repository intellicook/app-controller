//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/chat_by_recipe_post_response_model_function_call.dart';
import 'package:app_controller_client/src/model/chat_by_recipe_message_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_by_recipe_post_response_model.g.dart';

/// ChatByRecipePostResponseModel
///
/// Properties:
/// * [message] 
/// * [functionCall] 
@BuiltValue()
abstract class ChatByRecipePostResponseModel implements Built<ChatByRecipePostResponseModel, ChatByRecipePostResponseModelBuilder> {
  @BuiltValueField(wireName: r'message')
  ChatByRecipeMessageModel get message;

  @BuiltValueField(wireName: r'functionCall')
  ChatByRecipePostResponseModelFunctionCall? get functionCall;

  ChatByRecipePostResponseModel._();

  factory ChatByRecipePostResponseModel([void updates(ChatByRecipePostResponseModelBuilder b)]) = _$ChatByRecipePostResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChatByRecipePostResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChatByRecipePostResponseModel> get serializer => _$ChatByRecipePostResponseModelSerializer();
}

class _$ChatByRecipePostResponseModelSerializer implements PrimitiveSerializer<ChatByRecipePostResponseModel> {
  @override
  final Iterable<Type> types = const [ChatByRecipePostResponseModel, _$ChatByRecipePostResponseModel];

  @override
  final String wireName = r'ChatByRecipePostResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChatByRecipePostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(ChatByRecipeMessageModel),
    );
    if (object.functionCall != null) {
      yield r'functionCall';
      yield serializers.serialize(
        object.functionCall,
        specifiedType: const FullType.nullable(ChatByRecipePostResponseModelFunctionCall),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ChatByRecipePostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChatByRecipePostResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ChatByRecipeMessageModel),
          ) as ChatByRecipeMessageModel;
          result.message.replace(valueDes);
          break;
        case r'functionCall':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ChatByRecipePostResponseModelFunctionCall),
          ) as ChatByRecipePostResponseModelFunctionCall?;
          if (valueDes == null) continue;
          result.functionCall.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChatByRecipePostResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChatByRecipePostResponseModelBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

