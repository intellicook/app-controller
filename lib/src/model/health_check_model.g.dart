// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_check_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HealthCheckModel extends HealthCheckModel {
  @override
  final String name;
  @override
  final HealthStatusModel status;

  factory _$HealthCheckModel(
          [void Function(HealthCheckModelBuilder)? updates]) =>
      (new HealthCheckModelBuilder()..update(updates))._build();

  _$HealthCheckModel._({required this.name, required this.status}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'HealthCheckModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        status, r'HealthCheckModel', 'status');
  }

  @override
  HealthCheckModel rebuild(void Function(HealthCheckModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthCheckModelBuilder toBuilder() =>
      new HealthCheckModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthCheckModel &&
        name == other.name &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthCheckModel')
          ..add('name', name)
          ..add('status', status))
        .toString();
  }
}

class HealthCheckModelBuilder
    implements Builder<HealthCheckModel, HealthCheckModelBuilder> {
  _$HealthCheckModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  HealthStatusModel? _status;
  HealthStatusModel? get status => _$this._status;
  set status(HealthStatusModel? status) => _$this._status = status;

  HealthCheckModelBuilder() {
    HealthCheckModel._defaults(this);
  }

  HealthCheckModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthCheckModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HealthCheckModel;
  }

  @override
  void update(void Function(HealthCheckModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthCheckModel build() => _build();

  _$HealthCheckModel _build() {
    final _$result = _$v ??
        new _$HealthCheckModel._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'HealthCheckModel', 'name'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'HealthCheckModel', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
