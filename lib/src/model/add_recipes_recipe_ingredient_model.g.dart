// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_recipes_recipe_ingredient_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddRecipesRecipeIngredientModel
    extends AddRecipesRecipeIngredientModel {
  @override
  final String name;
  @override
  final double? quantity;
  @override
  final String? unit;

  factory _$AddRecipesRecipeIngredientModel(
          [void Function(AddRecipesRecipeIngredientModelBuilder)? updates]) =>
      (new AddRecipesRecipeIngredientModelBuilder()..update(updates))._build();

  _$AddRecipesRecipeIngredientModel._(
      {required this.name, this.quantity, this.unit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'AddRecipesRecipeIngredientModel', 'name');
  }

  @override
  AddRecipesRecipeIngredientModel rebuild(
          void Function(AddRecipesRecipeIngredientModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddRecipesRecipeIngredientModelBuilder toBuilder() =>
      new AddRecipesRecipeIngredientModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddRecipesRecipeIngredientModel &&
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
    return (newBuiltValueToStringHelper(r'AddRecipesRecipeIngredientModel')
          ..add('name', name)
          ..add('quantity', quantity)
          ..add('unit', unit))
        .toString();
  }
}

class AddRecipesRecipeIngredientModelBuilder
    implements
        Builder<AddRecipesRecipeIngredientModel,
            AddRecipesRecipeIngredientModelBuilder> {
  _$AddRecipesRecipeIngredientModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  AddRecipesRecipeIngredientModelBuilder() {
    AddRecipesRecipeIngredientModel._defaults(this);
  }

  AddRecipesRecipeIngredientModelBuilder get _$this {
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
  void replace(AddRecipesRecipeIngredientModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddRecipesRecipeIngredientModel;
  }

  @override
  void update(void Function(AddRecipesRecipeIngredientModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddRecipesRecipeIngredientModel build() => _build();

  _$AddRecipesRecipeIngredientModel _build() {
    final _$result = _$v ??
        new _$AddRecipesRecipeIngredientModel._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'AddRecipesRecipeIngredientModel', 'name'),
          quantity: quantity,
          unit: unit,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
