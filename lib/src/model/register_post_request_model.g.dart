// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_post_request_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterPostRequestModel extends RegisterPostRequestModel {
  @override
  final String name;
  @override
  final String username;
  @override
  final String email;
  @override
  final String password;

  factory _$RegisterPostRequestModel(
          [void Function(RegisterPostRequestModelBuilder)? updates]) =>
      (new RegisterPostRequestModelBuilder()..update(updates))._build();

  _$RegisterPostRequestModel._(
      {required this.name,
      required this.username,
      required this.email,
      required this.password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'RegisterPostRequestModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        username, r'RegisterPostRequestModel', 'username');
    BuiltValueNullFieldError.checkNotNull(
        email, r'RegisterPostRequestModel', 'email');
    BuiltValueNullFieldError.checkNotNull(
        password, r'RegisterPostRequestModel', 'password');
  }

  @override
  RegisterPostRequestModel rebuild(
          void Function(RegisterPostRequestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterPostRequestModelBuilder toBuilder() =>
      new RegisterPostRequestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterPostRequestModel &&
        name == other.name &&
        username == other.username &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterPostRequestModel')
          ..add('name', name)
          ..add('username', username)
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class RegisterPostRequestModelBuilder
    implements
        Builder<RegisterPostRequestModel, RegisterPostRequestModelBuilder> {
  _$RegisterPostRequestModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  RegisterPostRequestModelBuilder() {
    RegisterPostRequestModel._defaults(this);
  }

  RegisterPostRequestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _username = $v.username;
      _email = $v.email;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterPostRequestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterPostRequestModel;
  }

  @override
  void update(void Function(RegisterPostRequestModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterPostRequestModel build() => _build();

  _$RegisterPostRequestModel _build() {
    final _$result = _$v ??
        new _$RegisterPostRequestModel._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'RegisterPostRequestModel', 'name'),
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'RegisterPostRequestModel', 'username'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'RegisterPostRequestModel', 'email'),
          password: BuiltValueNullFieldError.checkNotNull(
              password, r'RegisterPostRequestModel', 'password'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
