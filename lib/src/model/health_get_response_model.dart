//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/health_status_model.dart';
import 'package:app_controller_client/src/model/health_check_model.dart';
import 'package:app_controller_client/src/model/health_service_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'health_get_response_model.g.dart';

/// HealthGetResponseModel
///
/// Properties:
/// * [service] 
/// * [status] 
/// * [checks] 
@BuiltValue()
abstract class HealthGetResponseModel implements Built<HealthGetResponseModel, HealthGetResponseModelBuilder> {
  @BuiltValueField(wireName: r'service')
  HealthServiceModel get service;
  // enum serviceEnum {  AppController,  Auth,  RecipeSearch,  };

  @BuiltValueField(wireName: r'status')
  HealthStatusModel get status;
  // enum statusEnum {  Healthy,  Degraded,  Unhealthy,  };

  @BuiltValueField(wireName: r'checks')
  BuiltList<HealthCheckModel> get checks;

  HealthGetResponseModel._();

  factory HealthGetResponseModel([void updates(HealthGetResponseModelBuilder b)]) = _$HealthGetResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HealthGetResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HealthGetResponseModel> get serializer => _$HealthGetResponseModelSerializer();
}

class _$HealthGetResponseModelSerializer implements PrimitiveSerializer<HealthGetResponseModel> {
  @override
  final Iterable<Type> types = const [HealthGetResponseModel, _$HealthGetResponseModel];

  @override
  final String wireName = r'HealthGetResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HealthGetResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'service';
    yield serializers.serialize(
      object.service,
      specifiedType: const FullType(HealthServiceModel),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(HealthStatusModel),
    );
    yield r'checks';
    yield serializers.serialize(
      object.checks,
      specifiedType: const FullType(BuiltList, [FullType(HealthCheckModel)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HealthGetResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HealthGetResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'service':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HealthServiceModel),
          ) as HealthServiceModel;
          result.service = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HealthStatusModel),
          ) as HealthStatusModel;
          result.status = valueDes;
          break;
        case r'checks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(HealthCheckModel)]),
          ) as BuiltList<HealthCheckModel>;
          result.checks.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HealthGetResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HealthGetResponseModelBuilder();
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

