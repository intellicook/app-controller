// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_recipe_ingredient_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecipeRecipeIngredientModel extends RecipeRecipeIngredientModel {
  @override
  final String name;
  @override
  final double? quantity;
  @override
  final String? unit;

  factory _$RecipeRecipeIngredientModel(
          [void Function(RecipeRecipeIngredientModelBuilder)? updates]) =>
      (new RecipeRecipeIngredientModelBuilder()..update(updates))._build();

  _$RecipeRecipeIngredientModel._(
      {required this.name, this.quantity, this.unit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'RecipeRecipeIngredientModel', 'name');
  }

  @override
  RecipeRecipeIngredientModel rebuild(
          void Function(RecipeRecipeIngredientModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeRecipeIngredientModelBuilder toBuilder() =>
      new RecipeRecipeIngredientModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeRecipeIngredientModel &&
        name == other.name &&
        quantity == other.quantity &&
        unit == other.unit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeRecipeIngredientModel')
          ..add('name', name)
          ..add('quantity', quantity)
          ..add('unit', unit))
        .toString();
  }
}

class RecipeRecipeIngredientModelBuilder
    implements
        Builder<RecipeRecipeIngredientModel,
            RecipeRecipeIngredientModelBuilder> {
  _$RecipeRecipeIngredientModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  RecipeRecipeIngredientModelBuilder() {
    RecipeRecipeIngredientModel._defaults(this);
  }

  RecipeRecipeIngredientModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _quantity = $v.quantity;
      _unit = $v.unit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeRecipeIngredientModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeRecipeIngredientModel;
  }

  @override
  void update(void Function(RecipeRecipeIngredientModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeRecipeIngredientModel build() => _build();

  _$RecipeRecipeIngredientModel _build() {
    final _$result = _$v ??
        new _$RecipeRecipeIngredientModel._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'RecipeRecipeIngredientModel', 'name'),
          quantity: quantity,
          unit: unit,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
