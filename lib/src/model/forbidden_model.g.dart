// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forbidden_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ForbiddenModel extends ForbiddenModel {
  @override
  final String message;

  factory _$ForbiddenModel([void Function(ForbiddenModelBuilder)? updates]) =>
      (new ForbiddenModelBuilder()..update(updates))._build();

  _$ForbiddenModel._({required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'ForbiddenModel', 'message');
  }

  @override
  ForbiddenModel rebuild(void Function(ForbiddenModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForbiddenModelBuilder toBuilder() =>
      new ForbiddenModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForbiddenModel && message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForbiddenModel')
          ..add('message', message))
        .toString();
  }
}

class ForbiddenModelBuilder
    implements Builder<ForbiddenModel, ForbiddenModelBuilder> {
  _$ForbiddenModel? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ForbiddenModelBuilder() {
    ForbiddenModel._defaults(this);
  }

  ForbiddenModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForbiddenModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForbiddenModel;
  }

  @override
  void update(void Function(ForbiddenModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForbiddenModel build() => _build();

  _$ForbiddenModel _build() {
    final _$result = _$v ??
        new _$ForbiddenModel._(
          message: BuiltValueNullFieldError.checkNotNull(
              message, r'ForbiddenModel', 'message'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
