// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faiss_index_thread_args_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FaissIndexThreadArgsModel extends FaissIndexThreadArgsModel {
  @override
  final int count;
  @override
  final String model;
  @override
  final String path;

  factory _$FaissIndexThreadArgsModel(
          [void Function(FaissIndexThreadArgsModelBuilder)? updates]) =>
      (new FaissIndexThreadArgsModelBuilder()..update(updates))._build();

  _$FaissIndexThreadArgsModel._(
      {required this.count, required this.model, required this.path})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        count, r'FaissIndexThreadArgsModel', 'count');
    BuiltValueNullFieldError.checkNotNull(
        model, r'FaissIndexThreadArgsModel', 'model');
    BuiltValueNullFieldError.checkNotNull(
        path, r'FaissIndexThreadArgsModel', 'path');
  }

  @override
  FaissIndexThreadArgsModel rebuild(
          void Function(FaissIndexThreadArgsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FaissIndexThreadArgsModelBuilder toBuilder() =>
      new FaissIndexThreadArgsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FaissIndexThreadArgsModel &&
        count == other.count &&
        model == other.model &&
        path == other.path;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FaissIndexThreadArgsModel')
          ..add('count', count)
          ..add('model', model)
          ..add('path', path))
        .toString();
  }
}

class FaissIndexThreadArgsModelBuilder
    implements
        Builder<FaissIndexThreadArgsModel, FaissIndexThreadArgsModelBuilder> {
  _$FaissIndexThreadArgsModel? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  FaissIndexThreadArgsModelBuilder() {
    FaissIndexThreadArgsModel._defaults(this);
  }

  FaissIndexThreadArgsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _model = $v.model;
      _path = $v.path;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FaissIndexThreadArgsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FaissIndexThreadArgsModel;
  }

  @override
  void update(void Function(FaissIndexThreadArgsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FaissIndexThreadArgsModel build() => _build();

  _$FaissIndexThreadArgsModel _build() {
    final _$result = _$v ??
        new _$FaissIndexThreadArgsModel._(
            count: BuiltValueNullFieldError.checkNotNull(
                count, r'FaissIndexThreadArgsModel', 'count'),
            model: BuiltValueNullFieldError.checkNotNull(
                model, r'FaissIndexThreadArgsModel', 'model'),
            path: BuiltValueNullFieldError.checkNotNull(
                path, r'FaissIndexThreadArgsModel', 'path'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
