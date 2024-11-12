// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_post_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchRecipesPostResponseModel extends SearchRecipesPostResponseModel {
  @override
  final BuiltList<SearchRecipesRecipeModel> recipes;

  factory _$SearchRecipesPostResponseModel(
          [void Function(SearchRecipesPostResponseModelBuilder)? updates]) =>
      (new SearchRecipesPostResponseModelBuilder()..update(updates))._build();

  _$SearchRecipesPostResponseModel._({required this.recipes}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        recipes, r'SearchRecipesPostResponseModel', 'recipes');
  }

  @override
  SearchRecipesPostResponseModel rebuild(
          void Function(SearchRecipesPostResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRecipesPostResponseModelBuilder toBuilder() =>
      new SearchRecipesPostResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRecipesPostResponseModel && recipes == other.recipes;
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
    return (newBuiltValueToStringHelper(r'SearchRecipesPostResponseModel')
          ..add('recipes', recipes))
        .toString();
  }
}

class SearchRecipesPostResponseModelBuilder
    implements
        Builder<SearchRecipesPostResponseModel,
            SearchRecipesPostResponseModelBuilder> {
  _$SearchRecipesPostResponseModel? _$v;

  ListBuilder<SearchRecipesRecipeModel>? _recipes;
  ListBuilder<SearchRecipesRecipeModel> get recipes =>
      _$this._recipes ??= new ListBuilder<SearchRecipesRecipeModel>();
  set recipes(ListBuilder<SearchRecipesRecipeModel>? recipes) =>
      _$this._recipes = recipes;

  SearchRecipesPostResponseModelBuilder() {
    SearchRecipesPostResponseModel._defaults(this);
  }

  SearchRecipesPostResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipes = $v.recipes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchRecipesPostResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRecipesPostResponseModel;
  }

  @override
  void update(void Function(SearchRecipesPostResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRecipesPostResponseModel build() => _build();

  _$SearchRecipesPostResponseModel _build() {
    _$SearchRecipesPostResponseModel _$result;
    try {
      _$result = _$v ??
          new _$SearchRecipesPostResponseModel._(recipes: recipes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recipes';
        recipes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchRecipesPostResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
