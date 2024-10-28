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
  final double distance;
  @override
  final String name;

  factory _$SearchRecipesByIngredientsRecipeModel(
          [void Function(SearchRecipesByIngredientsRecipeModelBuilder)?
              updates]) =>
      (new SearchRecipesByIngredientsRecipeModelBuilder()..update(updates))
          ._build();

  _$SearchRecipesByIngredientsRecipeModel._(
      {required this.id, required this.distance, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'SearchRecipesByIngredientsRecipeModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        distance, r'SearchRecipesByIngredientsRecipeModel', 'distance');
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
        distance == other.distance &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, distance.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'SearchRecipesByIngredientsRecipeModel')
          ..add('id', id)
          ..add('distance', distance)
          ..add('name', name))
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

  double? _distance;
  double? get distance => _$this._distance;
  set distance(double? distance) => _$this._distance = distance;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SearchRecipesByIngredientsRecipeModelBuilder() {
    SearchRecipesByIngredientsRecipeModel._defaults(this);
  }

  SearchRecipesByIngredientsRecipeModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _distance = $v.distance;
      _name = $v.name;
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
    final _$result = _$v ??
        new _$SearchRecipesByIngredientsRecipeModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SearchRecipesByIngredientsRecipeModel', 'id'),
            distance: BuiltValueNullFieldError.checkNotNull(
                distance, r'SearchRecipesByIngredientsRecipeModel', 'distance'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'SearchRecipesByIngredientsRecipeModel', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
