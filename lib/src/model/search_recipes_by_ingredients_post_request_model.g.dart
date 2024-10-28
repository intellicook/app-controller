// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_by_ingredients_post_request_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchRecipesByIngredientsPostRequestModel
    extends SearchRecipesByIngredientsPostRequestModel {
  @override
  final BuiltList<String> ingredients;
  @override
  final int? limit;

  factory _$SearchRecipesByIngredientsPostRequestModel(
          [void Function(SearchRecipesByIngredientsPostRequestModelBuilder)?
              updates]) =>
      (new SearchRecipesByIngredientsPostRequestModelBuilder()..update(updates))
          ._build();

  _$SearchRecipesByIngredientsPostRequestModel._(
      {required this.ingredients, this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(ingredients,
        r'SearchRecipesByIngredientsPostRequestModel', 'ingredients');
  }

  @override
  SearchRecipesByIngredientsPostRequestModel rebuild(
          void Function(SearchRecipesByIngredientsPostRequestModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRecipesByIngredientsPostRequestModelBuilder toBuilder() =>
      new SearchRecipesByIngredientsPostRequestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRecipesByIngredientsPostRequestModel &&
        ingredients == other.ingredients &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ingredients.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'SearchRecipesByIngredientsPostRequestModel')
          ..add('ingredients', ingredients)
          ..add('limit', limit))
        .toString();
  }
}

class SearchRecipesByIngredientsPostRequestModelBuilder
    implements
        Builder<SearchRecipesByIngredientsPostRequestModel,
            SearchRecipesByIngredientsPostRequestModelBuilder> {
  _$SearchRecipesByIngredientsPostRequestModel? _$v;

  ListBuilder<String>? _ingredients;
  ListBuilder<String> get ingredients =>
      _$this._ingredients ??= new ListBuilder<String>();
  set ingredients(ListBuilder<String>? ingredients) =>
      _$this._ingredients = ingredients;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  SearchRecipesByIngredientsPostRequestModelBuilder() {
    SearchRecipesByIngredientsPostRequestModel._defaults(this);
  }

  SearchRecipesByIngredientsPostRequestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ingredients = $v.ingredients.toBuilder();
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchRecipesByIngredientsPostRequestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRecipesByIngredientsPostRequestModel;
  }

  @override
  void update(
      void Function(SearchRecipesByIngredientsPostRequestModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRecipesByIngredientsPostRequestModel build() => _build();

  _$SearchRecipesByIngredientsPostRequestModel _build() {
    _$SearchRecipesByIngredientsPostRequestModel _$result;
    try {
      _$result = _$v ??
          new _$SearchRecipesByIngredientsPostRequestModel._(
              ingredients: ingredients.build(), limit: limit);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ingredients';
        ingredients.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchRecipesByIngredientsPostRequestModel',
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
