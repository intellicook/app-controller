// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_put_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserPutResponseModel extends UserPutResponseModel {
  @override
  final String accessToken;

  factory _$UserPutResponseModel(
          [void Function(UserPutResponseModelBuilder)? updates]) =>
      (new UserPutResponseModelBuilder()..update(updates))._build();

  _$UserPutResponseModel._({required this.accessToken}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        accessToken, r'UserPutResponseModel', 'accessToken');
  }

  @override
  UserPutResponseModel rebuild(
          void Function(UserPutResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPutResponseModelBuilder toBuilder() =>
      new UserPutResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPutResponseModel && accessToken == other.accessToken;
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
    return (newBuiltValueToStringHelper(r'UserPutResponseModel')
          ..add('accessToken', accessToken))
        .toString();
  }
}

class UserPutResponseModelBuilder
    implements Builder<UserPutResponseModel, UserPutResponseModelBuilder> {
  _$UserPutResponseModel? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  UserPutResponseModelBuilder() {
    UserPutResponseModel._defaults(this);
  }

  UserPutResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPutResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserPutResponseModel;
  }

  @override
  void update(void Function(UserPutResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserPutResponseModel build() => _build();

  _$UserPutResponseModel _build() {
    final _$result = _$v ??
        new _$UserPutResponseModel._(
          accessToken: BuiltValueNullFieldError.checkNotNull(
              accessToken, r'UserPutResponseModel', 'accessToken'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
