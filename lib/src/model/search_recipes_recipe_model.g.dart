// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_recipe_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchRecipesRecipeModel extends SearchRecipesRecipeModel {
  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final BuiltList<SearchRecipesRecipeIngredientModel> ingredients;
  @override
  final BuiltList<SearchRecipesMatchModel> matches;
  @override
  final SearchRecipesRecipeDetailModel? detail;

  factory _$SearchRecipesRecipeModel(
          [void Function(SearchRecipesRecipeModelBuilder)? updates]) =>
      (new SearchRecipesRecipeModelBuilder()..update(updates))._build();

  _$SearchRecipesRecipeModel._(
      {required this.id,
      required this.title,
      required this.description,
      required this.ingredients,
      required this.matches,
      this.detail})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'SearchRecipesRecipeModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'SearchRecipesRecipeModel', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'SearchRecipesRecipeModel', 'description');
    BuiltValueNullFieldError.checkNotNull(
        ingredients, r'SearchRecipesRecipeModel', 'ingredients');
    BuiltValueNullFieldError.checkNotNull(
        matches, r'SearchRecipesRecipeModel', 'matches');
  }

  @override
  SearchRecipesRecipeModel rebuild(
          void Function(SearchRecipesRecipeModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRecipesRecipeModelBuilder toBuilder() =>
      new SearchRecipesRecipeModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRecipesRecipeModel &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        ingredients == other.ingredients &&
        matches == other.matches &&
        detail == other.detail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, ingredients.hashCode);
    _$hash = $jc(_$hash, matches.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchRecipesRecipeModel')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('ingredients', ingredients)
          ..add('matches', matches)
          ..add('detail', detail))
        .toString();
  }
}

class SearchRecipesRecipeModelBuilder
    implements
        Builder<SearchRecipesRecipeModel, SearchRecipesRecipeModelBuilder> {
  _$SearchRecipesRecipeModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<SearchRecipesRecipeIngredientModel>? _ingredients;
  ListBuilder<SearchRecipesRecipeIngredientModel> get ingredients =>
      _$this._ingredients ??=
          new ListBuilder<SearchRecipesRecipeIngredientModel>();
  set ingredients(
          ListBuilder<SearchRecipesRecipeIngredientModel>? ingredients) =>
      _$this._ingredients = ingredients;

  ListBuilder<SearchRecipesMatchModel>? _matches;
  ListBuilder<SearchRecipesMatchModel> get matches =>
      _$this._matches ??= new ListBuilder<SearchRecipesMatchModel>();
  set matches(ListBuilder<SearchRecipesMatchModel>? matches) =>
      _$this._matches = matches;

  SearchRecipesRecipeDetailModelBuilder? _detail;
  SearchRecipesRecipeDetailModelBuilder get detail =>
      _$this._detail ??= new SearchRecipesRecipeDetailModelBuilder();
  set detail(SearchRecipesRecipeDetailModelBuilder? detail) =>
      _$this._detail = detail;

  SearchRecipesRecipeModelBuilder() {
    SearchRecipesRecipeModel._defaults(this);
  }

  SearchRecipesRecipeModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _ingredients = $v.ingredients.toBuilder();
      _matches = $v.matches.toBuilder();
      _detail = $v.detail?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchRecipesRecipeModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRecipesRecipeModel;
  }

  @override
  void update(void Function(SearchRecipesRecipeModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRecipesRecipeModel build() => _build();

  _$SearchRecipesRecipeModel _build() {
    _$SearchRecipesRecipeModel _$result;
    try {
      _$result = _$v ??
          new _$SearchRecipesRecipeModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SearchRecipesRecipeModel', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'SearchRecipesRecipeModel', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'SearchRecipesRecipeModel', 'description'),
            ingredients: ingredients.build(),
            matches: matches.build(),
            detail: _detail?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ingredients';
        ingredients.build();
        _$failedField = 'matches';
        matches.build();
        _$failedField = 'detail';
        _detail?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchRecipesRecipeModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
