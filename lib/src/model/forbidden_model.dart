//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forbidden_model.g.dart';

/// ForbiddenModel
///
/// Properties:
/// * [message] 
@BuiltValue()
abstract class ForbiddenModel implements Built<ForbiddenModel, ForbiddenModelBuilder> {
  @BuiltValueField(wireName: r'message')
  String get message;

  ForbiddenModel._();

  factory ForbiddenModel([void updates(ForbiddenModelBuilder b)]) = _$ForbiddenModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ForbiddenModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ForbiddenModel> get serializer => _$ForbiddenModelSerializer();
}

class _$ForbiddenModelSerializer implements PrimitiveSerializer<ForbiddenModel> {
  @override
  final Iterable<Type> types = const [ForbiddenModel, _$ForbiddenModel];

  @override
  final String wireName = r'ForbiddenModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ForbiddenModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ForbiddenModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ForbiddenModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ForbiddenModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ForbiddenModelBuilder();
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

