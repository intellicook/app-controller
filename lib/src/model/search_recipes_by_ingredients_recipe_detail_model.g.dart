// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_by_ingredients_recipe_detail_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchRecipesByIngredientsRecipeDetailModel
    extends SearchRecipesByIngredientsRecipeDetailModel {
  @override
  final BuiltList<String> ingredients;
  @override
  final BuiltList<String> instructions;
  @override
  final String raw;

  factory _$SearchRecipesByIngredientsRecipeDetailModel(
          [void Function(SearchRecipesByIngredientsRecipeDetailModelBuilder)?
              updates]) =>
      (new SearchRecipesByIngredientsRecipeDetailModelBuilder()
            ..update(updates))
          ._build();

  _$SearchRecipesByIngredientsRecipeDetailModel._(
      {required this.ingredients,
      required this.instructions,
      required this.raw})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(ingredients,
        r'SearchRecipesByIngredientsRecipeDetailModel', 'ingredients');
    BuiltValueNullFieldError.checkNotNull(instructions,
        r'SearchRecipesByIngredientsRecipeDetailModel', 'instructions');
    BuiltValueNullFieldError.checkNotNull(
        raw, r'SearchRecipesByIngredientsRecipeDetailModel', 'raw');
  }

  @override
  SearchRecipesByIngredientsRecipeDetailModel rebuild(
          void Function(SearchRecipesByIngredientsRecipeDetailModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRecipesByIngredientsRecipeDetailModelBuilder toBuilder() =>
      new SearchRecipesByIngredientsRecipeDetailModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRecipesByIngredientsRecipeDetailModel &&
        ingredients == other.ingredients &&
        instructions == other.instructions &&
        raw == other.raw;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ingredients.hashCode);
    _$hash = $jc(_$hash, instructions.hashCode);
    _$hash = $jc(_$hash, raw.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'SearchRecipesByIngredientsRecipeDetailModel')
          ..add('ingredients', ingredients)
          ..add('instructions', instructions)
          ..add('raw', raw))
        .toString();
  }
}

class SearchRecipesByIngredientsRecipeDetailModelBuilder
    implements
        Builder<SearchRecipesByIngredientsRecipeDetailModel,
            SearchRecipesByIngredientsRecipeDetailModelBuilder> {
  _$SearchRecipesByIngredientsRecipeDetailModel? _$v;

  ListBuilder<String>? _ingredients;
  ListBuilder<String> get ingredients =>
      _$this._ingredients ??= new ListBuilder<String>();
  set ingredients(ListBuilder<String>? ingredients) =>
      _$this._ingredients = ingredients;

  ListBuilder<String>? _instructions;
  ListBuilder<String> get instructions =>
      _$this._instructions ??= new ListBuilder<String>();
  set instructions(ListBuilder<String>? instructions) =>
      _$this._instructions = instructions;

  String? _raw;
  String? get raw => _$this._raw;
  set raw(String? raw) => _$this._raw = raw;

  SearchRecipesByIngredientsRecipeDetailModelBuilder() {
    SearchRecipesByIngredientsRecipeDetailModel._defaults(this);
  }

  SearchRecipesByIngredientsRecipeDetailModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ingredients = $v.ingredients.toBuilder();
      _instructions = $v.instructions.toBuilder();
      _raw = $v.raw;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchRecipesByIngredientsRecipeDetailModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRecipesByIngredientsRecipeDetailModel;
  }

  @override
  void update(
      void Function(SearchRecipesByIngredientsRecipeDetailModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRecipesByIngredientsRecipeDetailModel build() => _build();

  _$SearchRecipesByIngredientsRecipeDetailModel _build() {
    _$SearchRecipesByIngredientsRecipeDetailModel _$result;
    try {
      _$result = _$v ??
          new _$SearchRecipesByIngredientsRecipeDetailModel._(
            ingredients: ingredients.build(),
            instructions: instructions.build(),
            raw: BuiltValueNullFieldError.checkNotNull(
                raw, r'SearchRecipesByIngredientsRecipeDetailModel', 'raw'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ingredients';
        ingredients.build();
        _$failedField = 'instructions';
        instructions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchRecipesByIngredientsRecipeDetailModel',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
