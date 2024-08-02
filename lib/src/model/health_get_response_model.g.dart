// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_get_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HealthGetResponseModel extends HealthGetResponseModel {
  @override
  final HealthStatusModel status;
  @override
  final BuiltList<HealthCheckModel> checks;

  factory _$HealthGetResponseModel(
          [void Function(HealthGetResponseModelBuilder)? updates]) =>
      (new HealthGetResponseModelBuilder()..update(updates))._build();

  _$HealthGetResponseModel._({required this.status, required this.checks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        status, r'HealthGetResponseModel', 'status');
    BuiltValueNullFieldError.checkNotNull(
        checks, r'HealthGetResponseModel', 'checks');
  }

  @override
  HealthGetResponseModel rebuild(
          void Function(HealthGetResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthGetResponseModelBuilder toBuilder() =>
      new HealthGetResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthGetResponseModel &&
        status == other.status &&
        checks == other.checks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, checks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthGetResponseModel')
          ..add('status', status)
          ..add('checks', checks))
        .toString();
  }
}

class HealthGetResponseModelBuilder
    implements Builder<HealthGetResponseModel, HealthGetResponseModelBuilder> {
  _$HealthGetResponseModel? _$v;

  HealthStatusModel? _status;
  HealthStatusModel? get status => _$this._status;
  set status(HealthStatusModel? status) => _$this._status = status;

  ListBuilder<HealthCheckModel>? _checks;
  ListBuilder<HealthCheckModel> get checks =>
      _$this._checks ??= new ListBuilder<HealthCheckModel>();
  set checks(ListBuilder<HealthCheckModel>? checks) => _$this._checks = checks;

  HealthGetResponseModelBuilder() {
    HealthGetResponseModel._defaults(this);
  }

  HealthGetResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _checks = $v.checks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthGetResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HealthGetResponseModel;
  }

  @override
  void update(void Function(HealthGetResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthGetResponseModel build() => _build();

  _$HealthGetResponseModel _build() {
    _$HealthGetResponseModel _$result;
    try {
      _$result = _$v ??
          new _$HealthGetResponseModel._(
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'HealthGetResponseModel', 'status'),
              checks: checks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'checks';
        checks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'HealthGetResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
