// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_faiss_index_post_request_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitFaissIndexPostRequestModel extends InitFaissIndexPostRequestModel {
  @override
  final int? count;
  @override
  final String? path;

  factory _$InitFaissIndexPostRequestModel(
          [void Function(InitFaissIndexPostRequestModelBuilder)? updates]) =>
      (new InitFaissIndexPostRequestModelBuilder()..update(updates))._build();

  _$InitFaissIndexPostRequestModel._({this.count, this.path}) : super._();

  @override
  InitFaissIndexPostRequestModel rebuild(
          void Function(InitFaissIndexPostRequestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitFaissIndexPostRequestModelBuilder toBuilder() =>
      new InitFaissIndexPostRequestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitFaissIndexPostRequestModel &&
        count == other.count &&
        path == other.path;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitFaissIndexPostRequestModel')
          ..add('count', count)
          ..add('path', path))
        .toString();
  }
}

class InitFaissIndexPostRequestModelBuilder
    implements
        Builder<InitFaissIndexPostRequestModel,
            InitFaissIndexPostRequestModelBuilder> {
  _$InitFaissIndexPostRequestModel? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  InitFaissIndexPostRequestModelBuilder() {
    InitFaissIndexPostRequestModel._defaults(this);
  }

  InitFaissIndexPostRequestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _path = $v.path;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitFaissIndexPostRequestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitFaissIndexPostRequestModel;
  }

  @override
  void update(void Function(InitFaissIndexPostRequestModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitFaissIndexPostRequestModel build() => _build();

  _$InitFaissIndexPostRequestModel _build() {
    final _$result = _$v ??
        new _$InitFaissIndexPostRequestModel._(
          count: count,
          path: path,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
