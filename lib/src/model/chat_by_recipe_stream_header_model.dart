//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/chat_by_recipe_role_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_by_recipe_stream_header_model.g.dart';

/// ChatByRecipeStreamHeaderModel
///
/// Properties:
/// * [role] 
@BuiltValue()
abstract class ChatByRecipeStreamHeaderModel implements Built<ChatByRecipeStreamHeaderModel, ChatByRecipeStreamHeaderModelBuilder> {
  @BuiltValueField(wireName: r'role')
  ChatByRecipeRoleModel get role;
  // enum roleEnum {  System,  User,  Assistant,  };

  ChatByRecipeStreamHeaderModel._();

  factory ChatByRecipeStreamHeaderModel([void updates(ChatByRecipeStreamHeaderModelBuilder b)]) = _$ChatByRecipeStreamHeaderModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChatByRecipeStreamHeaderModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChatByRecipeStreamHeaderModel> get serializer => _$ChatByRecipeStreamHeaderModelSerializer();
}

class _$ChatByRecipeStreamHeaderModelSerializer implements PrimitiveSerializer<ChatByRecipeStreamHeaderModel> {
  @override
  final Iterable<Type> types = const [ChatByRecipeStreamHeaderModel, _$ChatByRecipeStreamHeaderModel];

  @override
  final String wireName = r'ChatByRecipeStreamHeaderModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChatByRecipeStreamHeaderModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(ChatByRecipeRoleModel),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ChatByRecipeStreamHeaderModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChatByRecipeStreamHeaderModelBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChatByRecipeStreamHeaderModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChatByRecipeStreamHeaderModelBuilder();
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

