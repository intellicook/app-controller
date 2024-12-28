// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faiss_index_thread_get_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FaissIndexThreadGetResponseModel
    extends FaissIndexThreadGetResponseModel {
  @override
  final FaissIndexThreadStatusModel status;
  @override
  final FaissIndexThreadArgsModel? args;

  factory _$FaissIndexThreadGetResponseModel(
          [void Function(FaissIndexThreadGetResponseModelBuilder)? updates]) =>
      (new FaissIndexThreadGetResponseModelBuilder()..update(updates))._build();

  _$FaissIndexThreadGetResponseModel._({required this.status, this.args})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        status, r'FaissIndexThreadGetResponseModel', 'status');
  }

  @override
  FaissIndexThreadGetResponseModel rebuild(
          void Function(FaissIndexThreadGetResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FaissIndexThreadGetResponseModelBuilder toBuilder() =>
      new FaissIndexThreadGetResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FaissIndexThreadGetResponseModel &&
        status == other.status &&
        args == other.args;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, args.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FaissIndexThreadGetResponseModel')
          ..add('status', status)
          ..add('args', args))
        .toString();
  }
}

class FaissIndexThreadGetResponseModelBuilder
    implements
        Builder<FaissIndexThreadGetResponseModel,
            FaissIndexThreadGetResponseModelBuilder> {
  _$FaissIndexThreadGetResponseModel? _$v;

  FaissIndexThreadStatusModel? _status;
  FaissIndexThreadStatusModel? get status => _$this._status;
  set status(FaissIndexThreadStatusModel? status) => _$this._status = status;

  FaissIndexThreadArgsModelBuilder? _args;
  FaissIndexThreadArgsModelBuilder get args =>
      _$this._args ??= new FaissIndexThreadArgsModelBuilder();
  set args(FaissIndexThreadArgsModelBuilder? args) => _$this._args = args;

  FaissIndexThreadGetResponseModelBuilder() {
    FaissIndexThreadGetResponseModel._defaults(this);
  }

  FaissIndexThreadGetResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _args = $v.args?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FaissIndexThreadGetResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FaissIndexThreadGetResponseModel;
  }

  @override
  void update(void Function(FaissIndexThreadGetResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FaissIndexThreadGetResponseModel build() => _build();

  _$FaissIndexThreadGetResponseModel _build() {
    _$FaissIndexThreadGetResponseModel _$result;
    try {
      _$result = _$v ??
          new _$FaissIndexThreadGetResponseModel._(
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'FaissIndexThreadGetResponseModel', 'status'),
            args: _args?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'args';
        _args?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FaissIndexThreadGetResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
