//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/faiss_index_thread_status_model.dart';
import 'package:app_controller_client/src/model/faiss_index_thread_args_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'faiss_index_thread_get_response_model.g.dart';

/// FaissIndexThreadGetResponseModel
///
/// Properties:
/// * [status] 
/// * [args] 
@BuiltValue()
abstract class FaissIndexThreadGetResponseModel implements Built<FaissIndexThreadGetResponseModel, FaissIndexThreadGetResponseModelBuilder> {
  @BuiltValueField(wireName: r'status')
  FaissIndexThreadStatusModel get status;
  // enum statusEnum {  Uninitialized,  InProgress,  Failed,  Completed,  };

  @BuiltValueField(wireName: r'args')
  FaissIndexThreadArgsModel? get args;

  FaissIndexThreadGetResponseModel._();

  factory FaissIndexThreadGetResponseModel([void updates(FaissIndexThreadGetResponseModelBuilder b)]) = _$FaissIndexThreadGetResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FaissIndexThreadGetResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FaissIndexThreadGetResponseModel> get serializer => _$FaissIndexThreadGetResponseModelSerializer();
}

class _$FaissIndexThreadGetResponseModelSerializer implements PrimitiveSerializer<FaissIndexThreadGetResponseModel> {
  @override
  final Iterable<Type> types = const [FaissIndexThreadGetResponseModel, _$FaissIndexThreadGetResponseModel];

  @override
  final String wireName = r'FaissIndexThreadGetResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FaissIndexThreadGetResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(FaissIndexThreadStatusModel),
    );
    if (object.args != null) {
      yield r'args';
      yield serializers.serialize(
        object.args,
        specifiedType: const FullType(FaissIndexThreadArgsModel),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    FaissIndexThreadGetResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FaissIndexThreadGetResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FaissIndexThreadStatusModel),
          ) as FaissIndexThreadStatusModel;
          result.status = valueDes;
          break;
        case r'args':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FaissIndexThreadArgsModel),
          ) as FaissIndexThreadArgsModel;
          result.args.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FaissIndexThreadGetResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FaissIndexThreadGetResponseModelBuilder();
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

