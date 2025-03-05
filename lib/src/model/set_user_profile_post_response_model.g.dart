// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_user_profile_post_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetUserProfilePostResponseModel
    extends SetUserProfilePostResponseModel {
  @override
  final UserProfileVeggieIdentityModel veggieIdentity;
  @override
  final BuiltList<String> prefer;
  @override
  final BuiltList<String> dislike;

  factory _$SetUserProfilePostResponseModel(
          [void Function(SetUserProfilePostResponseModelBuilder)? updates]) =>
      (new SetUserProfilePostResponseModelBuilder()..update(updates))._build();

  _$SetUserProfilePostResponseModel._(
      {required this.veggieIdentity,
      required this.prefer,
      required this.dislike})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        veggieIdentity, r'SetUserProfilePostResponseModel', 'veggieIdentity');
    BuiltValueNullFieldError.checkNotNull(
        prefer, r'SetUserProfilePostResponseModel', 'prefer');
    BuiltValueNullFieldError.checkNotNull(
        dislike, r'SetUserProfilePostResponseModel', 'dislike');
  }

  @override
  SetUserProfilePostResponseModel rebuild(
          void Function(SetUserProfilePostResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetUserProfilePostResponseModelBuilder toBuilder() =>
      new SetUserProfilePostResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetUserProfilePostResponseModel &&
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
    return (newBuiltValueToStringHelper(r'SetUserProfilePostResponseModel')
          ..add('veggieIdentity', veggieIdentity)
          ..add('prefer', prefer)
          ..add('dislike', dislike))
        .toString();
  }
}

class SetUserProfilePostResponseModelBuilder
    implements
        Builder<SetUserProfilePostResponseModel,
            SetUserProfilePostResponseModelBuilder> {
  _$SetUserProfilePostResponseModel? _$v;

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

  SetUserProfilePostResponseModelBuilder() {
    SetUserProfilePostResponseModel._defaults(this);
  }

  SetUserProfilePostResponseModelBuilder get _$this {
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
  void replace(SetUserProfilePostResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetUserProfilePostResponseModel;
  }

  @override
  void update(void Function(SetUserProfilePostResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetUserProfilePostResponseModel build() => _build();

  _$SetUserProfilePostResponseModel _build() {
    _$SetUserProfilePostResponseModel _$result;
    try {
      _$result = _$v ??
          new _$SetUserProfilePostResponseModel._(
            veggieIdentity: BuiltValueNullFieldError.checkNotNull(
                veggieIdentity,
                r'SetUserProfilePostResponseModel',
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
            r'SetUserProfilePostResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
