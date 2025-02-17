// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_recipe_ingredient_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchRecipesRecipeIngredientModel
    extends SearchRecipesRecipeIngredientModel {
  @override
  final String name;
  @override
  final double? quantity;
  @override
  final String? unit;

  factory _$SearchRecipesRecipeIngredientModel(
          [void Function(SearchRecipesRecipeIngredientModelBuilder)?
              updates]) =>
      (new SearchRecipesRecipeIngredientModelBuilder()..update(updates))
          ._build();

  _$SearchRecipesRecipeIngredientModel._(
      {required this.name, this.quantity, this.unit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'SearchRecipesRecipeIngredientModel', 'name');
  }

  @override
  SearchRecipesRecipeIngredientModel rebuild(
          void Function(SearchRecipesRecipeIngredientModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRecipesRecipeIngredientModelBuilder toBuilder() =>
      new SearchRecipesRecipeIngredientModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRecipesRecipeIngredientModel &&
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
    return (newBuiltValueToStringHelper(r'SearchRecipesRecipeIngredientModel')
          ..add('name', name)
          ..add('quantity', quantity)
          ..add('unit', unit))
        .toString();
  }
}

class SearchRecipesRecipeIngredientModelBuilder
    implements
        Builder<SearchRecipesRecipeIngredientModel,
            SearchRecipesRecipeIngredientModelBuilder> {
  _$SearchRecipesRecipeIngredientModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  SearchRecipesRecipeIngredientModelBuilder() {
    SearchRecipesRecipeIngredientModel._defaults(this);
  }

  SearchRecipesRecipeIngredientModelBuilder get _$this {
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
  void replace(SearchRecipesRecipeIngredientModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRecipesRecipeIngredientModel;
  }

  @override
  void update(
      void Function(SearchRecipesRecipeIngredientModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRecipesRecipeIngredientModel build() => _build();

  _$SearchRecipesRecipeIngredientModel _build() {
    final _$result = _$v ??
        new _$SearchRecipesRecipeIngredientModel._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'SearchRecipesRecipeIngredientModel', 'name'),
          quantity: quantity,
          unit: unit,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
