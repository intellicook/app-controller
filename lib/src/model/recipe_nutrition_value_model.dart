//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recipe_nutrition_value_model.g.dart';

class RecipeNutritionValueModel extends EnumClass {

  @BuiltValueEnumConst(wireName: r'High')
  static const RecipeNutritionValueModel high = _$high;
  @BuiltValueEnumConst(wireName: r'Medium')
  static const RecipeNutritionValueModel medium = _$medium;
  @BuiltValueEnumConst(wireName: r'Low')
  static const RecipeNutritionValueModel low = _$low;
  @BuiltValueEnumConst(wireName: r'None')
  static const RecipeNutritionValueModel none = _$none;

  static Serializer<RecipeNutritionValueModel> get serializer => _$recipeNutritionValueModelSerializer;

  const RecipeNutritionValueModel._(String name): super(name);

  static BuiltSet<RecipeNutritionValueModel> get values => _$values;
  static RecipeNutritionValueModel valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class RecipeNutritionValueModelMixin = Object with _$RecipeNutritionValueModelMixin;

