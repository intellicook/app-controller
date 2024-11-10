//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_faiss_index_post_request_model.g.dart';

/// InitFaissIndexPostRequestModel
///
/// Properties:
/// * [count] - Number of recipes in the database to index.
/// * [path] - Path to the index file. It is suggested to leave this empty because it is a file path on the server and depends on the server configuration.
@BuiltValue()
abstract class InitFaissIndexPostRequestModel implements Built<InitFaissIndexPostRequestModel, InitFaissIndexPostRequestModelBuilder> {
  /// Number of recipes in the database to index.
  @BuiltValueField(wireName: r'count')
  int? get count;

  /// Path to the index file. It is suggested to leave this empty because it is a file path on the server and depends on the server configuration.
  @BuiltValueField(wireName: r'path')
  String? get path;

  InitFaissIndexPostRequestModel._();

  factory InitFaissIndexPostRequestModel([void updates(InitFaissIndexPostRequestModelBuilder b)]) = _$InitFaissIndexPostRequestModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitFaissIndexPostRequestModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitFaissIndexPostRequestModel> get serializer => _$InitFaissIndexPostRequestModelSerializer();
}

class _$InitFaissIndexPostRequestModelSerializer implements PrimitiveSerializer<InitFaissIndexPostRequestModel> {
  @override
  final Iterable<Type> types = const [InitFaissIndexPostRequestModel, _$InitFaissIndexPostRequestModel];

  @override
  final String wireName = r'InitFaissIndexPostRequestModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitFaissIndexPostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.count != null) {
      yield r'count';
      yield serializers.serialize(
        object.count,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.path != null) {
      yield r'path';
      yield serializers.serialize(
        object.path,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InitFaissIndexPostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitFaissIndexPostRequestModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.count = valueDes;
          break;
        case r'path':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.path = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitFaissIndexPostRequestModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitFaissIndexPostRequestModelBuilder();
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

