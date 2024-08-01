// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_status_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const HealthStatusModel _$healthy = const HealthStatusModel._('healthy');
const HealthStatusModel _$degraded = const HealthStatusModel._('degraded');
const HealthStatusModel _$unhealthy = const HealthStatusModel._('unhealthy');

HealthStatusModel _$valueOf(String name) {
  switch (name) {
    case 'healthy':
      return _$healthy;
    case 'degraded':
      return _$degraded;
    case 'unhealthy':
      return _$unhealthy;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<HealthStatusModel> _$values =
    new BuiltSet<HealthStatusModel>(const <HealthStatusModel>[
  _$healthy,
  _$degraded,
  _$unhealthy,
]);

class _$HealthStatusModelMeta {
  const _$HealthStatusModelMeta();
  HealthStatusModel get healthy => _$healthy;
  HealthStatusModel get degraded => _$degraded;
  HealthStatusModel get unhealthy => _$unhealthy;
  HealthStatusModel valueOf(String name) => _$valueOf(name);
  BuiltSet<HealthStatusModel> get values => _$values;
}

abstract class _$HealthStatusModelMixin {
  // ignore: non_constant_identifier_names
  _$HealthStatusModelMeta get HealthStatusModel =>
      const _$HealthStatusModelMeta();
}

Serializer<HealthStatusModel> _$healthStatusModelSerializer =
    new _$HealthStatusModelSerializer();

class _$HealthStatusModelSerializer
    implements PrimitiveSerializer<HealthStatusModel> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'healthy': 'Healthy',
    'degraded': 'Degraded',
    'unhealthy': 'Unhealthy',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Healthy': 'healthy',
    'Degraded': 'degraded',
    'Unhealthy': 'unhealthy',
  };

  @override
  final Iterable<Type> types = const <Type>[HealthStatusModel];
  @override
  final String wireName = 'HealthStatusModel';

  @override
  Object serialize(Serializers serializers, HealthStatusModel object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  HealthStatusModel deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      HealthStatusModel.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
