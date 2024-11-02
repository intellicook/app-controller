// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_service_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const HealthServiceModel _$auth = const HealthServiceModel._('auth');
const HealthServiceModel _$recipeSearch =
    const HealthServiceModel._('recipeSearch');

HealthServiceModel _$valueOf(String name) {
  switch (name) {
    case 'auth':
      return _$auth;
    case 'recipeSearch':
      return _$recipeSearch;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<HealthServiceModel> _$values =
    new BuiltSet<HealthServiceModel>(const <HealthServiceModel>[
  _$auth,
  _$recipeSearch,
]);

class _$HealthServiceModelMeta {
  const _$HealthServiceModelMeta();
  HealthServiceModel get auth => _$auth;
  HealthServiceModel get recipeSearch => _$recipeSearch;
  HealthServiceModel valueOf(String name) => _$valueOf(name);
  BuiltSet<HealthServiceModel> get values => _$values;
}

abstract class _$HealthServiceModelMixin {
  // ignore: non_constant_identifier_names
  _$HealthServiceModelMeta get HealthServiceModel =>
      const _$HealthServiceModelMeta();
}

Serializer<HealthServiceModel> _$healthServiceModelSerializer =
    new _$HealthServiceModelSerializer();

class _$HealthServiceModelSerializer
    implements PrimitiveSerializer<HealthServiceModel> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'auth': 'Auth',
    'recipeSearch': 'RecipeSearch',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Auth': 'auth',
    'RecipeSearch': 'recipeSearch',
  };

  @override
  final Iterable<Type> types = const <Type>[HealthServiceModel];
  @override
  final String wireName = 'HealthServiceModel';

  @override
  Object serialize(Serializers serializers, HealthServiceModel object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  HealthServiceModel deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      HealthServiceModel.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
