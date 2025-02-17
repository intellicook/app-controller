// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_recipe_detail_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchRecipesRecipeDetailModel extends SearchRecipesRecipeDetailModel {
  @override
  final BuiltList<String> directions;
  @override
  final BuiltList<String> tips;
  @override
  final BuiltList<String> utensils;
  @override
  final RecipeNutritionModel nutrition;

  factory _$SearchRecipesRecipeDetailModel(
          [void Function(SearchRecipesRecipeDetailModelBuilder)? updates]) =>
      (new SearchRecipesRecipeDetailModelBuilder()..update(updates))._build();

  _$SearchRecipesRecipeDetailModel._(
      {required this.directions,
      required this.tips,
      required this.utensils,
      required this.nutrition})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        directions, r'SearchRecipesRecipeDetailModel', 'directions');
    BuiltValueNullFieldError.checkNotNull(
        tips, r'SearchRecipesRecipeDetailModel', 'tips');
    BuiltValueNullFieldError.checkNotNull(
        utensils, r'SearchRecipesRecipeDetailModel', 'utensils');
    BuiltValueNullFieldError.checkNotNull(
        nutrition, r'SearchRecipesRecipeDetailModel', 'nutrition');
  }

  @override
  SearchRecipesRecipeDetailModel rebuild(
          void Function(SearchRecipesRecipeDetailModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRecipesRecipeDetailModelBuilder toBuilder() =>
      new SearchRecipesRecipeDetailModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRecipesRecipeDetailModel &&
        directions == other.directions &&
        tips == other.tips &&
        utensils == other.utensils &&
        nutrition == other.nutrition;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, directions.hashCode);
    _$hash = $jc(_$hash, tips.hashCode);
    _$hash = $jc(_$hash, utensils.hashCode);
    _$hash = $jc(_$hash, nutrition.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchRecipesRecipeDetailModel')
          ..add('directions', directions)
          ..add('tips', tips)
          ..add('utensils', utensils)
          ..add('nutrition', nutrition))
        .toString();
  }
}

class SearchRecipesRecipeDetailModelBuilder
    implements
        Builder<SearchRecipesRecipeDetailModel,
            SearchRecipesRecipeDetailModelBuilder> {
  _$SearchRecipesRecipeDetailModel? _$v;

  ListBuilder<String>? _directions;
  ListBuilder<String> get directions =>
      _$this._directions ??= new ListBuilder<String>();
  set directions(ListBuilder<String>? directions) =>
      _$this._directions = directions;

  ListBuilder<String>? _tips;
  ListBuilder<String> get tips => _$this._tips ??= new ListBuilder<String>();
  set tips(ListBuilder<String>? tips) => _$this._tips = tips;

  ListBuilder<String>? _utensils;
  ListBuilder<String> get utensils =>
      _$this._utensils ??= new ListBuilder<String>();
  set utensils(ListBuilder<String>? utensils) => _$this._utensils = utensils;

  RecipeNutritionModelBuilder? _nutrition;
  RecipeNutritionModelBuilder get nutrition =>
      _$this._nutrition ??= new RecipeNutritionModelBuilder();
  set nutrition(RecipeNutritionModelBuilder? nutrition) =>
      _$this._nutrition = nutrition;

  SearchRecipesRecipeDetailModelBuilder() {
    SearchRecipesRecipeDetailModel._defaults(this);
  }

  SearchRecipesRecipeDetailModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _directions = $v.directions.toBuilder();
      _tips = $v.tips.toBuilder();
      _utensils = $v.utensils.toBuilder();
      _nutrition = $v.nutrition.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchRecipesRecipeDetailModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRecipesRecipeDetailModel;
  }

  @override
  void update(void Function(SearchRecipesRecipeDetailModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRecipesRecipeDetailModel build() => _build();

  _$SearchRecipesRecipeDetailModel _build() {
    _$SearchRecipesRecipeDetailModel _$result;
    try {
      _$result = _$v ??
          new _$SearchRecipesRecipeDetailModel._(
            directions: directions.build(),
            tips: tips.build(),
            utensils: utensils.build(),
            nutrition: nutrition.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'directions';
        directions.build();
        _$failedField = 'tips';
        tips.build();
        _$failedField = 'utensils';
        utensils.build();
        _$failedField = 'nutrition';
        nutrition.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchRecipesRecipeDetailModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
