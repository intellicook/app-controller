// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_nutrition_value_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RecipeNutritionValueModel _$high =
    const RecipeNutritionValueModel._('high');
const RecipeNutritionValueModel _$medium =
    const RecipeNutritionValueModel._('medium');
const RecipeNutritionValueModel _$low =
    const RecipeNutritionValueModel._('low');
const RecipeNutritionValueModel _$none =
    const RecipeNutritionValueModel._('none');

RecipeNutritionValueModel _$valueOf(String name) {
  switch (name) {
    case 'high':
      return _$high;
    case 'medium':
      return _$medium;
    case 'low':
      return _$low;
    case 'none':
      return _$none;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<RecipeNutritionValueModel> _$values =
    new BuiltSet<RecipeNutritionValueModel>(const <RecipeNutritionValueModel>[
  _$high,
  _$medium,
  _$low,
  _$none,
]);

class _$RecipeNutritionValueModelMeta {
  const _$RecipeNutritionValueModelMeta();
  RecipeNutritionValueModel get high => _$high;
  RecipeNutritionValueModel get medium => _$medium;
  RecipeNutritionValueModel get low => _$low;
  RecipeNutritionValueModel get none => _$none;
  RecipeNutritionValueModel valueOf(String name) => _$valueOf(name);
  BuiltSet<RecipeNutritionValueModel> get values => _$values;
}

abstract class _$RecipeNutritionValueModelMixin {
  // ignore: non_constant_identifier_names
  _$RecipeNutritionValueModelMeta get RecipeNutritionValueModel =>
      const _$RecipeNutritionValueModelMeta();
}

Serializer<RecipeNutritionValueModel> _$recipeNutritionValueModelSerializer =
    new _$RecipeNutritionValueModelSerializer();

class _$RecipeNutritionValueModelSerializer
    implements PrimitiveSerializer<RecipeNutritionValueModel> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'high': 'High',
    'medium': 'Medium',
    'low': 'Low',
    'none': 'None',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'High': 'high',
    'Medium': 'medium',
    'Low': 'low',
    'None': 'none',
  };

  @override
  final Iterable<Type> types = const <Type>[RecipeNutritionValueModel];
  @override
  final String wireName = 'RecipeNutritionValueModel';

  @override
  Object serialize(Serializers serializers, RecipeNutritionValueModel object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  RecipeNutritionValueModel deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RecipeNutritionValueModel.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
