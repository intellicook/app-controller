// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_details_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class ProblemDetailsModelBuilder {
  void replace(ProblemDetailsModel other);
  void update(void Function(ProblemDetailsModelBuilder) updates);
  String? get type;
  set type(String? type);

  String? get title;
  set title(String? title);

  int? get status;
  set status(int? status);

  String? get detail;
  set detail(String? detail);

  String? get instance;
  set instance(String? instance);

  String? get traceId;
  set traceId(String? traceId);
}

class _$$ProblemDetailsModel extends $ProblemDetailsModel {
  @override
  final String? type;
  @override
  final String? title;
  @override
  final int? status;
  @override
  final String? detail;
  @override
  final String? instance;
  @override
  final String? traceId;

  factory _$$ProblemDetailsModel(
          [void Function($ProblemDetailsModelBuilder)? updates]) =>
      (new $ProblemDetailsModelBuilder()..update(updates))._build();

  _$$ProblemDetailsModel._(
      {this.type,
      this.title,
      this.status,
      this.detail,
      this.instance,
      this.traceId})
      : super._();

  @override
  $ProblemDetailsModel rebuild(
          void Function($ProblemDetailsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $ProblemDetailsModelBuilder toBuilder() =>
      new $ProblemDetailsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $ProblemDetailsModel &&
        type == other.type &&
        title == other.title &&
        status == other.status &&
        detail == other.detail &&
        instance == other.instance &&
        traceId == other.traceId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jc(_$hash, instance.hashCode);
    _$hash = $jc(_$hash, traceId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$ProblemDetailsModel')
          ..add('type', type)
          ..add('title', title)
          ..add('status', status)
          ..add('detail', detail)
          ..add('instance', instance)
          ..add('traceId', traceId))
        .toString();
  }
}

class $ProblemDetailsModelBuilder
    implements
        Builder<$ProblemDetailsModel, $ProblemDetailsModelBuilder>,
        ProblemDetailsModelBuilder {
  _$$ProblemDetailsModel? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  int? _status;
  int? get status => _$this._status;
  set status(covariant int? status) => _$this._status = status;

  String? _detail;
  String? get detail => _$this._detail;
  set detail(covariant String? detail) => _$this._detail = detail;

  String? _instance;
  String? get instance => _$this._instance;
  set instance(covariant String? instance) => _$this._instance = instance;

  String? _traceId;
  String? get traceId => _$this._traceId;
  set traceId(covariant String? traceId) => _$this._traceId = traceId;

  $ProblemDetailsModelBuilder() {
    $ProblemDetailsModel._defaults(this);
  }

  $ProblemDetailsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _title = $v.title;
      _status = $v.status;
      _detail = $v.detail;
      _instance = $v.instance;
      _traceId = $v.traceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $ProblemDetailsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$ProblemDetailsModel;
  }

  @override
  void update(void Function($ProblemDetailsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $ProblemDetailsModel build() => _build();

  _$$ProblemDetailsModel _build() {
    final _$result = _$v ??
        new _$$ProblemDetailsModel._(
            type: type,
            title: title,
            status: status,
            detail: detail,
            instance: instance,
            traceId: traceId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
