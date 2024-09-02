// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UserRoleModel _$user = const UserRoleModel._('user');
const UserRoleModel _$admin = const UserRoleModel._('admin');

UserRoleModel _$valueOf(String name) {
  switch (name) {
    case 'user':
      return _$user;
    case 'admin':
      return _$admin;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<UserRoleModel> _$values =
    new BuiltSet<UserRoleModel>(const <UserRoleModel>[
  _$user,
  _$admin,
]);

class _$UserRoleModelMeta {
  const _$UserRoleModelMeta();
  UserRoleModel get user => _$user;
  UserRoleModel get admin => _$admin;
  UserRoleModel valueOf(String name) => _$valueOf(name);
  BuiltSet<UserRoleModel> get values => _$values;
}

abstract class _$UserRoleModelMixin {
  // ignore: non_constant_identifier_names
  _$UserRoleModelMeta get UserRoleModel => const _$UserRoleModelMeta();
}

Serializer<UserRoleModel> _$userRoleModelSerializer =
    new _$UserRoleModelSerializer();

class _$UserRoleModelSerializer implements PrimitiveSerializer<UserRoleModel> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'user': 'User',
    'admin': 'Admin',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'User': 'user',
    'Admin': 'admin',
  };

  @override
  final Iterable<Type> types = const <Type>[UserRoleModel];
  @override
  final String wireName = 'UserRoleModel';

  @override
  Object serialize(Serializers serializers, UserRoleModel object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UserRoleModel deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UserRoleModel.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
