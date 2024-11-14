//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_by_recipe_stream_content_model.g.dart';

/// ChatByRecipeStreamContentModel
///
/// Properties:
/// * [text] 
@BuiltValue()
abstract class ChatByRecipeStreamContentModel implements Built<ChatByRecipeStreamContentModel, ChatByRecipeStreamContentModelBuilder> {
  @BuiltValueField(wireName: r'text')
  String get text;

  ChatByRecipeStreamContentModel._();

  factory ChatByRecipeStreamContentModel([void updates(ChatByRecipeStreamContentModelBuilder b)]) = _$ChatByRecipeStreamContentModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChatByRecipeStreamContentModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChatByRecipeStreamContentModel> get serializer => _$ChatByRecipeStreamContentModelSerializer();
}

class _$ChatByRecipeStreamContentModelSerializer implements PrimitiveSerializer<ChatByRecipeStreamContentModel> {
  @override
  final Iterable<Type> types = const [ChatByRecipeStreamContentModel, _$ChatByRecipeStreamContentModel];

  @override
  final String wireName = r'ChatByRecipeStreamContentModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChatByRecipeStreamContentModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'text';
    yield serializers.serialize(
      object.text,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ChatByRecipeStreamContentModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChatByRecipeStreamContentModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  ChatByRecipeStreamContentModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChatByRecipeStreamContentModelBuilder();
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

