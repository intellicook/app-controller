// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_veggie_identity_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UserProfileVeggieIdentityModel _$none =
    const UserProfileVeggieIdentityModel._('none');
const UserProfileVeggieIdentityModel _$vegetarian =
    const UserProfileVeggieIdentityModel._('vegetarian');
const UserProfileVeggieIdentityModel _$vegan =
    const UserProfileVeggieIdentityModel._('vegan');

UserProfileVeggieIdentityModel _$valueOf(String name) {
  switch (name) {
    case 'none':
      return _$none;
    case 'vegetarian':
      return _$vegetarian;
    case 'vegan':
      return _$vegan;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<UserProfileVeggieIdentityModel> _$values = new BuiltSet<
    UserProfileVeggieIdentityModel>(const <UserProfileVeggieIdentityModel>[
  _$none,
  _$vegetarian,
  _$vegan,
]);

class _$UserProfileVeggieIdentityModelMeta {
  const _$UserProfileVeggieIdentityModelMeta();
  UserProfileVeggieIdentityModel get none => _$none;
  UserProfileVeggieIdentityModel get vegetarian => _$vegetarian;
  UserProfileVeggieIdentityModel get vegan => _$vegan;
  UserProfileVeggieIdentityModel valueOf(String name) => _$valueOf(name);
  BuiltSet<UserProfileVeggieIdentityModel> get values => _$values;
}

abstract class _$UserProfileVeggieIdentityModelMixin {
  // ignore: non_constant_identifier_names
  _$UserProfileVeggieIdentityModelMeta get UserProfileVeggieIdentityModel =>
      const _$UserProfileVeggieIdentityModelMeta();
}

Serializer<UserProfileVeggieIdentityModel>
    _$userProfileVeggieIdentityModelSerializer =
    new _$UserProfileVeggieIdentityModelSerializer();

class _$UserProfileVeggieIdentityModelSerializer
    implements PrimitiveSerializer<UserProfileVeggieIdentityModel> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'none': 'None',
    'vegetarian': 'Vegetarian',
    'vegan': 'Vegan',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'None': 'none',
    'Vegetarian': 'vegetarian',
    'Vegan': 'vegan',
  };

  @override
  final Iterable<Type> types = const <Type>[UserProfileVeggieIdentityModel];
  @override
  final String wireName = 'UserProfileVeggieIdentityModel';

  @override
  Object serialize(
          Serializers serializers, UserProfileVeggieIdentityModel object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UserProfileVeggieIdentityModel deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UserProfileVeggieIdentityModel.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
