//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'health_status_model.g.dart';

class HealthStatusModel extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Healthy')
  static const HealthStatusModel healthy = _$healthy;
  @BuiltValueEnumConst(wireName: r'Degraded')
  static const HealthStatusModel degraded = _$degraded;
  @BuiltValueEnumConst(wireName: r'Unhealthy')
  static const HealthStatusModel unhealthy = _$unhealthy;

  static Serializer<HealthStatusModel> get serializer => _$healthStatusModelSerializer;

  const HealthStatusModel._(String name): super(name);

  static BuiltSet<HealthStatusModel> get values => _$values;
  static HealthStatusModel valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class HealthStatusModelMixin = Object with _$HealthStatusModelMixin;

