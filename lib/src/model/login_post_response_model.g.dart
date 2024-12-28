// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_post_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginPostResponseModel extends LoginPostResponseModel {
  @override
  final String accessToken;

  factory _$LoginPostResponseModel(
          [void Function(LoginPostResponseModelBuilder)? updates]) =>
      (new LoginPostResponseModelBuilder()..update(updates))._build();

  _$LoginPostResponseModel._({required this.accessToken}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        accessToken, r'LoginPostResponseModel', 'accessToken');
  }

  @override
  LoginPostResponseModel rebuild(
          void Function(LoginPostResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginPostResponseModelBuilder toBuilder() =>
      new LoginPostResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginPostResponseModel && accessToken == other.accessToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginPostResponseModel')
          ..add('accessToken', accessToken))
        .toString();
  }
}

class LoginPostResponseModelBuilder
    implements Builder<LoginPostResponseModel, LoginPostResponseModelBuilder> {
  _$LoginPostResponseModel? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  LoginPostResponseModelBuilder() {
    LoginPostResponseModel._defaults(this);
  }

  LoginPostResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginPostResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginPostResponseModel;
  }

  @override
  void update(void Function(LoginPostResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginPostResponseModel build() => _build();

  _$LoginPostResponseModel _build() {
    final _$result = _$v ??
        new _$LoginPostResponseModel._(
          accessToken: BuiltValueNullFieldError.checkNotNull(
              accessToken, r'LoginPostResponseModel', 'accessToken'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
