// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_nutrition_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecipeNutritionModel extends RecipeNutritionModel {
  @override
  final RecipeNutritionValueModel calories;
  @override
  final RecipeNutritionValueModel fat;
  @override
  final RecipeNutritionValueModel protein;
  @override
  final RecipeNutritionValueModel carbs;

  factory _$RecipeNutritionModel(
          [void Function(RecipeNutritionModelBuilder)? updates]) =>
      (new RecipeNutritionModelBuilder()..update(updates))._build();

  _$RecipeNutritionModel._(
      {required this.calories,
      required this.fat,
      required this.protein,
      required this.carbs})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        calories, r'RecipeNutritionModel', 'calories');
    BuiltValueNullFieldError.checkNotNull(fat, r'RecipeNutritionModel', 'fat');
    BuiltValueNullFieldError.checkNotNull(
        protein, r'RecipeNutritionModel', 'protein');
    BuiltValueNullFieldError.checkNotNull(
        carbs, r'RecipeNutritionModel', 'carbs');
  }

  @override
  RecipeNutritionModel rebuild(
          void Function(RecipeNutritionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeNutritionModelBuilder toBuilder() =>
      new RecipeNutritionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeNutritionModel &&
        calories == other.calories &&
        fat == other.fat &&
        protein == other.protein &&
        carbs == other.carbs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, calories.hashCode);
    _$hash = $jc(_$hash, fat.hashCode);
    _$hash = $jc(_$hash, protein.hashCode);
    _$hash = $jc(_$hash, carbs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeNutritionModel')
          ..add('calories', calories)
          ..add('fat', fat)
          ..add('protein', protein)
          ..add('carbs', carbs))
        .toString();
  }
}

class RecipeNutritionModelBuilder
    implements Builder<RecipeNutritionModel, RecipeNutritionModelBuilder> {
  _$RecipeNutritionModel? _$v;

  RecipeNutritionValueModel? _calories;
  RecipeNutritionValueModel? get calories => _$this._calories;
  set calories(RecipeNutritionValueModel? calories) =>
      _$this._calories = calories;

  RecipeNutritionValueModel? _fat;
  RecipeNutritionValueModel? get fat => _$this._fat;
  set fat(RecipeNutritionValueModel? fat) => _$this._fat = fat;

  RecipeNutritionValueModel? _protein;
  RecipeNutritionValueModel? get protein => _$this._protein;
  set protein(RecipeNutritionValueModel? protein) => _$this._protein = protein;

  RecipeNutritionValueModel? _carbs;
  RecipeNutritionValueModel? get carbs => _$this._carbs;
  set carbs(RecipeNutritionValueModel? carbs) => _$this._carbs = carbs;

  RecipeNutritionModelBuilder() {
    RecipeNutritionModel._defaults(this);
  }

  RecipeNutritionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _calories = $v.calories;
      _fat = $v.fat;
      _protein = $v.protein;
      _carbs = $v.carbs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeNutritionModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeNutritionModel;
  }

  @override
  void update(void Function(RecipeNutritionModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeNutritionModel build() => _build();

  _$RecipeNutritionModel _build() {
    final _$result = _$v ??
        new _$RecipeNutritionModel._(
          calories: BuiltValueNullFieldError.checkNotNull(
              calories, r'RecipeNutritionModel', 'calories'),
          fat: BuiltValueNullFieldError.checkNotNull(
              fat, r'RecipeNutritionModel', 'fat'),
          protein: BuiltValueNullFieldError.checkNotNull(
              protein, r'RecipeNutritionModel', 'protein'),
          carbs: BuiltValueNullFieldError.checkNotNull(
              carbs, r'RecipeNutritionModel', 'carbs'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
