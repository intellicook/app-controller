//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'faiss_index_thread_args_model.g.dart';

/// FaissIndexThreadArgsModel
///
/// Properties:
/// * [count] 
/// * [model] 
/// * [path] 
@BuiltValue()
abstract class FaissIndexThreadArgsModel implements Built<FaissIndexThreadArgsModel, FaissIndexThreadArgsModelBuilder> {
  @BuiltValueField(wireName: r'count')
  int get count;

  @BuiltValueField(wireName: r'model')
  String get model;

  @BuiltValueField(wireName: r'path')
  String get path;

  FaissIndexThreadArgsModel._();

  factory FaissIndexThreadArgsModel([void updates(FaissIndexThreadArgsModelBuilder b)]) = _$FaissIndexThreadArgsModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FaissIndexThreadArgsModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FaissIndexThreadArgsModel> get serializer => _$FaissIndexThreadArgsModelSerializer();
}

class _$FaissIndexThreadArgsModelSerializer implements PrimitiveSerializer<FaissIndexThreadArgsModel> {
  @override
  final Iterable<Type> types = const [FaissIndexThreadArgsModel, _$FaissIndexThreadArgsModel];

  @override
  final String wireName = r'FaissIndexThreadArgsModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FaissIndexThreadArgsModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'count';
    yield serializers.serialize(
      object.count,
      specifiedType: const FullType(int),
    );
    yield r'model';
    yield serializers.serialize(
      object.model,
      specifiedType: const FullType(String),
    );
    yield r'path';
    yield serializers.serialize(
      object.path,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FaissIndexThreadArgsModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FaissIndexThreadArgsModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.count = valueDes;
          break;
        case r'model':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.model = valueDes;
          break;
        case r'path':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
  FaissIndexThreadArgsModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FaissIndexThreadArgsModelBuilder();
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

