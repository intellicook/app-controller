// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_get_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserGetResponseModel extends UserGetResponseModel {
  @override
  final String name;
  @override
  final UserRoleModel role;
  @override
  final String username;
  @override
  final String email;

  factory _$UserGetResponseModel(
          [void Function(UserGetResponseModelBuilder)? updates]) =>
      (new UserGetResponseModelBuilder()..update(updates))._build();

  _$UserGetResponseModel._(
      {required this.name,
      required this.role,
      required this.username,
      required this.email})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'UserGetResponseModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        role, r'UserGetResponseModel', 'role');
    BuiltValueNullFieldError.checkNotNull(
        username, r'UserGetResponseModel', 'username');
    BuiltValueNullFieldError.checkNotNull(
        email, r'UserGetResponseModel', 'email');
  }

  @override
  UserGetResponseModel rebuild(
          void Function(UserGetResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserGetResponseModelBuilder toBuilder() =>
      new UserGetResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserGetResponseModel &&
        name == other.name &&
        role == other.role &&
        username == other.username &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserGetResponseModel')
          ..add('name', name)
          ..add('role', role)
          ..add('username', username)
          ..add('email', email))
        .toString();
  }
}

class UserGetResponseModelBuilder
    implements Builder<UserGetResponseModel, UserGetResponseModelBuilder> {
  _$UserGetResponseModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  UserRoleModel? _role;
  UserRoleModel? get role => _$this._role;
  set role(UserRoleModel? role) => _$this._role = role;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  UserGetResponseModelBuilder() {
    UserGetResponseModel._defaults(this);
  }

  UserGetResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _role = $v.role;
      _username = $v.username;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserGetResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserGetResponseModel;
  }

  @override
  void update(void Function(UserGetResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserGetResponseModel build() => _build();

  _$UserGetResponseModel _build() {
    final _$result = _$v ??
        new _$UserGetResponseModel._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'UserGetResponseModel', 'name'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'UserGetResponseModel', 'role'),
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'UserGetResponseModel', 'username'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'UserGetResponseModel', 'email'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
