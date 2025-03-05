// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_post_request_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchRecipesPostRequestModel extends SearchRecipesPostRequestModel {
  @override
  final BuiltList<String> ingredients;
  @override
  final String? extraTerms;
  @override
  final int? page;
  @override
  final int? perPage;
  @override
  final bool? includeDetail;

  factory _$SearchRecipesPostRequestModel(
          [void Function(SearchRecipesPostRequestModelBuilder)? updates]) =>
      (new SearchRecipesPostRequestModelBuilder()..update(updates))._build();

  _$SearchRecipesPostRequestModel._(
      {required this.ingredients,
      this.extraTerms,
      this.page,
      this.perPage,
      this.includeDetail})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ingredients, r'SearchRecipesPostRequestModel', 'ingredients');
  }

  @override
  SearchRecipesPostRequestModel rebuild(
          void Function(SearchRecipesPostRequestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRecipesPostRequestModelBuilder toBuilder() =>
      new SearchRecipesPostRequestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRecipesPostRequestModel &&
        ingredients == other.ingredients &&
        extraTerms == other.extraTerms &&
        page == other.page &&
        perPage == other.perPage &&
        includeDetail == other.includeDetail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ingredients.hashCode);
    _$hash = $jc(_$hash, extraTerms.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, perPage.hashCode);
    _$hash = $jc(_$hash, includeDetail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchRecipesPostRequestModel')
          ..add('ingredients', ingredients)
          ..add('extraTerms', extraTerms)
          ..add('page', page)
          ..add('perPage', perPage)
          ..add('includeDetail', includeDetail))
        .toString();
  }
}

class SearchRecipesPostRequestModelBuilder
    implements
        Builder<SearchRecipesPostRequestModel,
            SearchRecipesPostRequestModelBuilder> {
  _$SearchRecipesPostRequestModel? _$v;

  ListBuilder<String>? _ingredients;
  ListBuilder<String> get ingredients =>
      _$this._ingredients ??= new ListBuilder<String>();
  set ingredients(ListBuilder<String>? ingredients) =>
      _$this._ingredients = ingredients;

  String? _extraTerms;
  String? get extraTerms => _$this._extraTerms;
  set extraTerms(String? extraTerms) => _$this._extraTerms = extraTerms;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _perPage;
  int? get perPage => _$this._perPage;
  set perPage(int? perPage) => _$this._perPage = perPage;

  bool? _includeDetail;
  bool? get includeDetail => _$this._includeDetail;
  set includeDetail(bool? includeDetail) =>
      _$this._includeDetail = includeDetail;

  SearchRecipesPostRequestModelBuilder() {
    SearchRecipesPostRequestModel._defaults(this);
  }

  SearchRecipesPostRequestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ingredients = $v.ingredients.toBuilder();
      _extraTerms = $v.extraTerms;
      _page = $v.page;
      _perPage = $v.perPage;
      _includeDetail = $v.includeDetail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchRecipesPostRequestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRecipesPostRequestModel;
  }

  @override
  void update(void Function(SearchRecipesPostRequestModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRecipesPostRequestModel build() => _build();

  _$SearchRecipesPostRequestModel _build() {
    _$SearchRecipesPostRequestModel _$result;
    try {
      _$result = _$v ??
          new _$SearchRecipesPostRequestModel._(
            ingredients: ingredients.build(),
            extraTerms: extraTerms,
            page: page,
            perPage: perPage,
            includeDetail: includeDetail,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ingredients';
        ingredients.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchRecipesPostRequestModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
