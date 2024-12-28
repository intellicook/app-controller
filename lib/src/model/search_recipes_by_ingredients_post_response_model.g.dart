// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_by_ingredients_post_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchRecipesByIngredientsPostResponseModel
    extends SearchRecipesByIngredientsPostResponseModel {
  @override
  final BuiltList<SearchRecipesByIngredientsRecipeModel> recipes;

  factory _$SearchRecipesByIngredientsPostResponseModel(
          [void Function(SearchRecipesByIngredientsPostResponseModelBuilder)?
              updates]) =>
      (new SearchRecipesByIngredientsPostResponseModelBuilder()
            ..update(updates))
          ._build();

  _$SearchRecipesByIngredientsPostResponseModel._({required this.recipes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        recipes, r'SearchRecipesByIngredientsPostResponseModel', 'recipes');
  }

  @override
  SearchRecipesByIngredientsPostResponseModel rebuild(
          void Function(SearchRecipesByIngredientsPostResponseModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRecipesByIngredientsPostResponseModelBuilder toBuilder() =>
      new SearchRecipesByIngredientsPostResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRecipesByIngredientsPostResponseModel &&
        recipes == other.recipes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recipes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'SearchRecipesByIngredientsPostResponseModel')
          ..add('recipes', recipes))
        .toString();
  }
}

class SearchRecipesByIngredientsPostResponseModelBuilder
    implements
        Builder<SearchRecipesByIngredientsPostResponseModel,
            SearchRecipesByIngredientsPostResponseModelBuilder> {
  _$SearchRecipesByIngredientsPostResponseModel? _$v;

  ListBuilder<SearchRecipesByIngredientsRecipeModel>? _recipes;
  ListBuilder<SearchRecipesByIngredientsRecipeModel> get recipes =>
      _$this._recipes ??=
          new ListBuilder<SearchRecipesByIngredientsRecipeModel>();
  set recipes(ListBuilder<SearchRecipesByIngredientsRecipeModel>? recipes) =>
      _$this._recipes = recipes;

  SearchRecipesByIngredientsPostResponseModelBuilder() {
    SearchRecipesByIngredientsPostResponseModel._defaults(this);
  }

  SearchRecipesByIngredientsPostResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipes = $v.recipes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchRecipesByIngredientsPostResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRecipesByIngredientsPostResponseModel;
  }

  @override
  void update(
      void Function(SearchRecipesByIngredientsPostResponseModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRecipesByIngredientsPostResponseModel build() => _build();

  _$SearchRecipesByIngredientsPostResponseModel _build() {
    _$SearchRecipesByIngredientsPostResponseModel _$result;
    try {
      _$result = _$v ??
          new _$SearchRecipesByIngredientsPostResponseModel._(
            recipes: recipes.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recipes';
        recipes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchRecipesByIngredientsPostResponseModel',
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
