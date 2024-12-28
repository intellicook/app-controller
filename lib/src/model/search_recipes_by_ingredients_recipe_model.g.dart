// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_by_ingredients_recipe_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchRecipesByIngredientsRecipeModel
    extends SearchRecipesByIngredientsRecipeModel {
  @override
  final int id;
  @override
  final String name;
  @override
  final SearchRecipesByIngredientsRecipeDetailModel? detail;

  factory _$SearchRecipesByIngredientsRecipeModel(
          [void Function(SearchRecipesByIngredientsRecipeModelBuilder)?
              updates]) =>
      (new SearchRecipesByIngredientsRecipeModelBuilder()..update(updates))
          ._build();

  _$SearchRecipesByIngredientsRecipeModel._(
      {required this.id, required this.name, this.detail})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'SearchRecipesByIngredientsRecipeModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'SearchRecipesByIngredientsRecipeModel', 'name');
  }

  @override
  SearchRecipesByIngredientsRecipeModel rebuild(
          void Function(SearchRecipesByIngredientsRecipeModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRecipesByIngredientsRecipeModelBuilder toBuilder() =>
      new SearchRecipesByIngredientsRecipeModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRecipesByIngredientsRecipeModel &&
        id == other.id &&
        name == other.name &&
        detail == other.detail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'SearchRecipesByIngredientsRecipeModel')
          ..add('id', id)
          ..add('name', name)
          ..add('detail', detail))
        .toString();
  }
}

class SearchRecipesByIngredientsRecipeModelBuilder
    implements
        Builder<SearchRecipesByIngredientsRecipeModel,
            SearchRecipesByIngredientsRecipeModelBuilder> {
  _$SearchRecipesByIngredientsRecipeModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SearchRecipesByIngredientsRecipeDetailModelBuilder? _detail;
  SearchRecipesByIngredientsRecipeDetailModelBuilder get detail =>
      _$this._detail ??=
          new SearchRecipesByIngredientsRecipeDetailModelBuilder();
  set detail(SearchRecipesByIngredientsRecipeDetailModelBuilder? detail) =>
      _$this._detail = detail;

  SearchRecipesByIngredientsRecipeModelBuilder() {
    SearchRecipesByIngredientsRecipeModel._defaults(this);
  }

  SearchRecipesByIngredientsRecipeModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _detail = $v.detail?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchRecipesByIngredientsRecipeModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRecipesByIngredientsRecipeModel;
  }

  @override
  void update(
      void Function(SearchRecipesByIngredientsRecipeModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRecipesByIngredientsRecipeModel build() => _build();

  _$SearchRecipesByIngredientsRecipeModel _build() {
    _$SearchRecipesByIngredientsRecipeModel _$result;
    try {
      _$result = _$v ??
          new _$SearchRecipesByIngredientsRecipeModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SearchRecipesByIngredientsRecipeModel', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'SearchRecipesByIngredientsRecipeModel', 'name'),
            detail: _detail?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'detail';
        _detail?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchRecipesByIngredientsRecipeModel',
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
