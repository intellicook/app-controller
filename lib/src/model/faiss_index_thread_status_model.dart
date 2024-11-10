//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'faiss_index_thread_status_model.g.dart';

class FaissIndexThreadStatusModel extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Uninitialized')
  static const FaissIndexThreadStatusModel uninitialized = _$uninitialized;
  @BuiltValueEnumConst(wireName: r'InProgress')
  static const FaissIndexThreadStatusModel inProgress = _$inProgress;
  @BuiltValueEnumConst(wireName: r'Failed')
  static const FaissIndexThreadStatusModel failed = _$failed;
  @BuiltValueEnumConst(wireName: r'Completed')
  static const FaissIndexThreadStatusModel completed = _$completed;

  static Serializer<FaissIndexThreadStatusModel> get serializer => _$faissIndexThreadStatusModelSerializer;

  const FaissIndexThreadStatusModel._(String name): super(name);

  static BuiltSet<FaissIndexThreadStatusModel> get values => _$values;
  static FaissIndexThreadStatusModel valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class FaissIndexThreadStatusModelMixin = Object with _$FaissIndexThreadStatusModelMixin;

