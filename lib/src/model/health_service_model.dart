//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'health_service_model.g.dart';

class HealthServiceModel extends EnumClass {

  @BuiltValueEnumConst(wireName: r'AppController')
  static const HealthServiceModel appController = _$appController;
  @BuiltValueEnumConst(wireName: r'Auth')
  static const HealthServiceModel auth = _$auth;
  @BuiltValueEnumConst(wireName: r'RecipeSearch')
  static const HealthServiceModel recipeSearch = _$recipeSearch;

  static Serializer<HealthServiceModel> get serializer => _$healthServiceModelSerializer;

  const HealthServiceModel._(String name): super(name);

  static BuiltSet<HealthServiceModel> get values => _$values;
  static HealthServiceModel valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class HealthServiceModelMixin = Object with _$HealthServiceModelMixin;

