// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_post_request_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginPostRequestModel extends LoginPostRequestModel {
  @override
  final String username;
  @override
  final String password;

  factory _$LoginPostRequestModel(
          [void Function(LoginPostRequestModelBuilder)? updates]) =>
      (new LoginPostRequestModelBuilder()..update(updates))._build();

  _$LoginPostRequestModel._({required this.username, required this.password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        username, r'LoginPostRequestModel', 'username');
    BuiltValueNullFieldError.checkNotNull(
        password, r'LoginPostRequestModel', 'password');
  }

  @override
  LoginPostRequestModel rebuild(
          void Function(LoginPostRequestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginPostRequestModelBuilder toBuilder() =>
      new LoginPostRequestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginPostRequestModel &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginPostRequestModel')
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class LoginPostRequestModelBuilder
    implements Builder<LoginPostRequestModel, LoginPostRequestModelBuilder> {
  _$LoginPostRequestModel? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  LoginPostRequestModelBuilder() {
    LoginPostRequestModel._defaults(this);
  }

  LoginPostRequestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginPostRequestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginPostRequestModel;
  }

  @override
  void update(void Function(LoginPostRequestModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginPostRequestModel build() => _build();

  _$LoginPostRequestModel _build() {
    final _$result = _$v ??
        new _$LoginPostRequestModel._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'LoginPostRequestModel', 'username'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'LoginPostRequestModel', 'password'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
