//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/health_status_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'health_check_model.g.dart';

/// HealthCheckModel
///
/// Properties:
/// * [name] 
/// * [status] 
@BuiltValue()
abstract class HealthCheckModel implements Built<HealthCheckModel, HealthCheckModelBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'status')
  HealthStatusModel? get status;
  // enum statusEnum {  Healthy,  Degraded,  Unhealthy,  };

  HealthCheckModel._();

  factory HealthCheckModel([void updates(HealthCheckModelBuilder b)]) = _$HealthCheckModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HealthCheckModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HealthCheckModel> get serializer => _$HealthCheckModelSerializer();
}

class _$HealthCheckModelSerializer implements PrimitiveSerializer<HealthCheckModel> {
  @override
  final Iterable<Type> types = const [HealthCheckModel, _$HealthCheckModel];

  @override
  final String wireName = r'HealthCheckModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HealthCheckModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(HealthStatusModel),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    HealthCheckModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HealthCheckModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HealthStatusModel),
          ) as HealthStatusModel;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HealthCheckModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HealthCheckModelBuilder();
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

