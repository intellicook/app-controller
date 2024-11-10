// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faiss_index_thread_status_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FaissIndexThreadStatusModel _$uninitialized =
    const FaissIndexThreadStatusModel._('uninitialized');
const FaissIndexThreadStatusModel _$inProgress =
    const FaissIndexThreadStatusModel._('inProgress');
const FaissIndexThreadStatusModel _$failed =
    const FaissIndexThreadStatusModel._('failed');
const FaissIndexThreadStatusModel _$completed =
    const FaissIndexThreadStatusModel._('completed');

FaissIndexThreadStatusModel _$valueOf(String name) {
  switch (name) {
    case 'uninitialized':
      return _$uninitialized;
    case 'inProgress':
      return _$inProgress;
    case 'failed':
      return _$failed;
    case 'completed':
      return _$completed;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<FaissIndexThreadStatusModel> _$values = new BuiltSet<
    FaissIndexThreadStatusModel>(const <FaissIndexThreadStatusModel>[
  _$uninitialized,
  _$inProgress,
  _$failed,
  _$completed,
]);

class _$FaissIndexThreadStatusModelMeta {
  const _$FaissIndexThreadStatusModelMeta();
  FaissIndexThreadStatusModel get uninitialized => _$uninitialized;
  FaissIndexThreadStatusModel get inProgress => _$inProgress;
  FaissIndexThreadStatusModel get failed => _$failed;
  FaissIndexThreadStatusModel get completed => _$completed;
  FaissIndexThreadStatusModel valueOf(String name) => _$valueOf(name);
  BuiltSet<FaissIndexThreadStatusModel> get values => _$values;
}

abstract class _$FaissIndexThreadStatusModelMixin {
  // ignore: non_constant_identifier_names
  _$FaissIndexThreadStatusModelMeta get FaissIndexThreadStatusModel =>
      const _$FaissIndexThreadStatusModelMeta();
}

Serializer<FaissIndexThreadStatusModel>
    _$faissIndexThreadStatusModelSerializer =
    new _$FaissIndexThreadStatusModelSerializer();

class _$FaissIndexThreadStatusModelSerializer
    implements PrimitiveSerializer<FaissIndexThreadStatusModel> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'uninitialized': 'Uninitialized',
    'inProgress': 'InProgress',
    'failed': 'Failed',
    'completed': 'Completed',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Uninitialized': 'uninitialized',
    'InProgress': 'inProgress',
    'Failed': 'failed',
    'Completed': 'completed',
  };

  @override
  final Iterable<Type> types = const <Type>[FaissIndexThreadStatusModel];
  @override
  final String wireName = 'FaissIndexThreadStatusModel';

  @override
  Object serialize(Serializers serializers, FaissIndexThreadStatusModel object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  FaissIndexThreadStatusModel deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FaissIndexThreadStatusModel.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
