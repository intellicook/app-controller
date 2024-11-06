//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/chat_by_recipe_message_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_by_recipe_post_request_model.g.dart';

/// ChatByRecipePostRequestModel
///
/// Properties:
/// * [id] 
/// * [messages] 
@BuiltValue()
abstract class ChatByRecipePostRequestModel implements Built<ChatByRecipePostRequestModel, ChatByRecipePostRequestModelBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'messages')
  BuiltList<ChatByRecipeMessageModel> get messages;

  ChatByRecipePostRequestModel._();

  factory ChatByRecipePostRequestModel([void updates(ChatByRecipePostRequestModelBuilder b)]) = _$ChatByRecipePostRequestModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChatByRecipePostRequestModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChatByRecipePostRequestModel> get serializer => _$ChatByRecipePostRequestModelSerializer();
}

class _$ChatByRecipePostRequestModelSerializer implements PrimitiveSerializer<ChatByRecipePostRequestModel> {
  @override
  final Iterable<Type> types = const [ChatByRecipePostRequestModel, _$ChatByRecipePostRequestModel];

  @override
  final String wireName = r'ChatByRecipePostRequestModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChatByRecipePostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'messages';
    yield serializers.serialize(
      object.messages,
      specifiedType: const FullType(BuiltList, [FullType(ChatByRecipeMessageModel)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ChatByRecipePostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChatByRecipePostRequestModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'messages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ChatByRecipeMessageModel)]),
          ) as BuiltList<ChatByRecipeMessageModel>;
          result.messages.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChatByRecipePostRequestModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChatByRecipePostRequestModelBuilder();
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

