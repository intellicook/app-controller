//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/chat_by_recipe_role_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_by_recipe_message_model.g.dart';

/// ChatByRecipeMessageModel
///
/// Properties:
/// * [role] 
/// * [text] 
@BuiltValue()
abstract class ChatByRecipeMessageModel implements Built<ChatByRecipeMessageModel, ChatByRecipeMessageModelBuilder> {
  @BuiltValueField(wireName: r'role')
  ChatByRecipeRoleModel get role;
  // enum roleEnum {  System,  User,  Assistant,  };

  @BuiltValueField(wireName: r'text')
  String get text;

  ChatByRecipeMessageModel._();

  factory ChatByRecipeMessageModel([void updates(ChatByRecipeMessageModelBuilder b)]) = _$ChatByRecipeMessageModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChatByRecipeMessageModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChatByRecipeMessageModel> get serializer => _$ChatByRecipeMessageModelSerializer();
}

class _$ChatByRecipeMessageModelSerializer implements PrimitiveSerializer<ChatByRecipeMessageModel> {
  @override
  final Iterable<Type> types = const [ChatByRecipeMessageModel, _$ChatByRecipeMessageModel];

  @override
  final String wireName = r'ChatByRecipeMessageModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChatByRecipeMessageModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(ChatByRecipeRoleModel),
    );
    yield r'text';
    yield serializers.serialize(
      object.text,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ChatByRecipeMessageModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChatByRecipeMessageModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ChatByRecipeRoleModel),
          ) as ChatByRecipeRoleModel;
          result.role = valueDes;
          break;
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChatByRecipeMessageModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChatByRecipeMessageModelBuilder();
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

