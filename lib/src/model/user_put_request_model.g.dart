// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_put_request_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserPutRequestModel extends UserPutRequestModel {
  @override
  final String name;
  @override
  final String username;
  @override
  final String email;

  factory _$UserPutRequestModel(
          [void Function(UserPutRequestModelBuilder)? updates]) =>
      (new UserPutRequestModelBuilder()..update(updates))._build();

  _$UserPutRequestModel._(
      {required this.name, required this.username, required this.email})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'UserPutRequestModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        username, r'UserPutRequestModel', 'username');
    BuiltValueNullFieldError.checkNotNull(
        email, r'UserPutRequestModel', 'email');
  }

  @override
  UserPutRequestModel rebuild(
          void Function(UserPutRequestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPutRequestModelBuilder toBuilder() =>
      new UserPutRequestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPutRequestModel &&
        name == other.name &&
        username == other.username &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserPutRequestModel')
          ..add('name', name)
          ..add('username', username)
          ..add('email', email))
        .toString();
  }
}

class UserPutRequestModelBuilder
    implements Builder<UserPutRequestModel, UserPutRequestModelBuilder> {
  _$UserPutRequestModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  UserPutRequestModelBuilder() {
    UserPutRequestModel._defaults(this);
  }

  UserPutRequestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _username = $v.username;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPutRequestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserPutRequestModel;
  }

  @override
  void update(void Function(UserPutRequestModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserPutRequestModel build() => _build();

  _$UserPutRequestModel _build() {
    final _$result = _$v ??
        new _$UserPutRequestModel._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'UserPutRequestModel', 'name'),
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'UserPutRequestModel', 'username'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'UserPutRequestModel', 'email'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
