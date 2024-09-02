// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_password_put_request_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserPasswordPutRequestModel extends UserPasswordPutRequestModel {
  @override
  final String oldPassword;
  @override
  final String newPassword;

  factory _$UserPasswordPutRequestModel(
          [void Function(UserPasswordPutRequestModelBuilder)? updates]) =>
      (new UserPasswordPutRequestModelBuilder()..update(updates))._build();

  _$UserPasswordPutRequestModel._(
      {required this.oldPassword, required this.newPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        oldPassword, r'UserPasswordPutRequestModel', 'oldPassword');
    BuiltValueNullFieldError.checkNotNull(
        newPassword, r'UserPasswordPutRequestModel', 'newPassword');
  }

  @override
  UserPasswordPutRequestModel rebuild(
          void Function(UserPasswordPutRequestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPasswordPutRequestModelBuilder toBuilder() =>
      new UserPasswordPutRequestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPasswordPutRequestModel &&
        oldPassword == other.oldPassword &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oldPassword.hashCode);
    _$hash = $jc(_$hash, newPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserPasswordPutRequestModel')
          ..add('oldPassword', oldPassword)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class UserPasswordPutRequestModelBuilder
    implements
        Builder<UserPasswordPutRequestModel,
            UserPasswordPutRequestModelBuilder> {
  _$UserPasswordPutRequestModel? _$v;

  String? _oldPassword;
  String? get oldPassword => _$this._oldPassword;
  set oldPassword(String? oldPassword) => _$this._oldPassword = oldPassword;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  UserPasswordPutRequestModelBuilder() {
    UserPasswordPutRequestModel._defaults(this);
  }

  UserPasswordPutRequestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oldPassword = $v.oldPassword;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPasswordPutRequestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserPasswordPutRequestModel;
  }

  @override
  void update(void Function(UserPasswordPutRequestModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserPasswordPutRequestModel build() => _build();

  _$UserPasswordPutRequestModel _build() {
    final _$result = _$v ??
        new _$UserPasswordPutRequestModel._(
            oldPassword: BuiltValueNullFieldError.checkNotNull(
                oldPassword, r'UserPasswordPutRequestModel', 'oldPassword'),
            newPassword: BuiltValueNullFieldError.checkNotNull(
                newPassword, r'UserPasswordPutRequestModel', 'newPassword'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
