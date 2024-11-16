// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_users_get404_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminUsersGet404Response extends AdminUsersGet404Response {
  @override
  final OneOf oneOf;

  factory _$AdminUsersGet404Response(
          [void Function(AdminUsersGet404ResponseBuilder)? updates]) =>
      (new AdminUsersGet404ResponseBuilder()..update(updates))._build();

  _$AdminUsersGet404Response._({required this.oneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        oneOf, r'AdminUsersGet404Response', 'oneOf');
  }

  @override
  AdminUsersGet404Response rebuild(
          void Function(AdminUsersGet404ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminUsersGet404ResponseBuilder toBuilder() =>
      new AdminUsersGet404ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminUsersGet404Response && oneOf == other.oneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminUsersGet404Response')
          ..add('oneOf', oneOf))
        .toString();
  }
}

class AdminUsersGet404ResponseBuilder
    implements
        Builder<AdminUsersGet404Response, AdminUsersGet404ResponseBuilder> {
  _$AdminUsersGet404Response? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  AdminUsersGet404ResponseBuilder() {
    AdminUsersGet404Response._defaults(this);
  }

  AdminUsersGet404ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminUsersGet404Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdminUsersGet404Response;
  }

  @override
  void update(void Function(AdminUsersGet404ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminUsersGet404Response build() => _build();

  _$AdminUsersGet404Response _build() {
    final _$result = _$v ??
        new _$AdminUsersGet404Response._(
            oneOf: BuiltValueNullFieldError.checkNotNull(
                oneOf, r'AdminUsersGet404Response', 'oneOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
