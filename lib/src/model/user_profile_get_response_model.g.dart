// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_get_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserProfileGetResponseModel extends UserProfileGetResponseModel {
  @override
  final UserProfileVeggieIdentityModel veggieIdentity;
  @override
  final BuiltList<String> prefer;
  @override
  final BuiltList<String> dislike;

  factory _$UserProfileGetResponseModel(
          [void Function(UserProfileGetResponseModelBuilder)? updates]) =>
      (new UserProfileGetResponseModelBuilder()..update(updates))._build();

  _$UserProfileGetResponseModel._(
      {required this.veggieIdentity,
      required this.prefer,
      required this.dislike})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        veggieIdentity, r'UserProfileGetResponseModel', 'veggieIdentity');
    BuiltValueNullFieldError.checkNotNull(
        prefer, r'UserProfileGetResponseModel', 'prefer');
    BuiltValueNullFieldError.checkNotNull(
        dislike, r'UserProfileGetResponseModel', 'dislike');
  }

  @override
  UserProfileGetResponseModel rebuild(
          void Function(UserProfileGetResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileGetResponseModelBuilder toBuilder() =>
      new UserProfileGetResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfileGetResponseModel &&
        veggieIdentity == other.veggieIdentity &&
        prefer == other.prefer &&
        dislike == other.dislike;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, veggieIdentity.hashCode);
    _$hash = $jc(_$hash, prefer.hashCode);
    _$hash = $jc(_$hash, dislike.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserProfileGetResponseModel')
          ..add('veggieIdentity', veggieIdentity)
          ..add('prefer', prefer)
          ..add('dislike', dislike))
        .toString();
  }
}

class UserProfileGetResponseModelBuilder
    implements
        Builder<UserProfileGetResponseModel,
            UserProfileGetResponseModelBuilder> {
  _$UserProfileGetResponseModel? _$v;

  UserProfileVeggieIdentityModel? _veggieIdentity;
  UserProfileVeggieIdentityModel? get veggieIdentity => _$this._veggieIdentity;
  set veggieIdentity(UserProfileVeggieIdentityModel? veggieIdentity) =>
      _$this._veggieIdentity = veggieIdentity;

  ListBuilder<String>? _prefer;
  ListBuilder<String> get prefer =>
      _$this._prefer ??= new ListBuilder<String>();
  set prefer(ListBuilder<String>? prefer) => _$this._prefer = prefer;

  ListBuilder<String>? _dislike;
  ListBuilder<String> get dislike =>
      _$this._dislike ??= new ListBuilder<String>();
  set dislike(ListBuilder<String>? dislike) => _$this._dislike = dislike;

  UserProfileGetResponseModelBuilder() {
    UserProfileGetResponseModel._defaults(this);
  }

  UserProfileGetResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _veggieIdentity = $v.veggieIdentity;
      _prefer = $v.prefer.toBuilder();
      _dislike = $v.dislike.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfileGetResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserProfileGetResponseModel;
  }

  @override
  void update(void Function(UserProfileGetResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserProfileGetResponseModel build() => _build();

  _$UserProfileGetResponseModel _build() {
    _$UserProfileGetResponseModel _$result;
    try {
      _$result = _$v ??
          new _$UserProfileGetResponseModel._(
            veggieIdentity: BuiltValueNullFieldError.checkNotNull(
                veggieIdentity,
                r'UserProfileGetResponseModel',
                'veggieIdentity'),
            prefer: prefer.build(),
            dislike: dislike.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'prefer';
        prefer.build();
        _$failedField = 'dislike';
        dislike.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserProfileGetResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
