// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_recipes_response_recipe_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddRecipesResponseRecipeModel extends AddRecipesResponseRecipeModel {
  @override
  final int id;
  @override
  final String name;
  @override
  final BuiltList<String> ingredients;
  @override
  final BuiltList<String> instructions;
  @override
  final String raw;

  factory _$AddRecipesResponseRecipeModel(
          [void Function(AddRecipesResponseRecipeModelBuilder)? updates]) =>
      (new AddRecipesResponseRecipeModelBuilder()..update(updates))._build();

  _$AddRecipesResponseRecipeModel._(
      {required this.id,
      required this.name,
      required this.ingredients,
      required this.instructions,
      required this.raw})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'AddRecipesResponseRecipeModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'AddRecipesResponseRecipeModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        ingredients, r'AddRecipesResponseRecipeModel', 'ingredients');
    BuiltValueNullFieldError.checkNotNull(
        instructions, r'AddRecipesResponseRecipeModel', 'instructions');
    BuiltValueNullFieldError.checkNotNull(
        raw, r'AddRecipesResponseRecipeModel', 'raw');
  }

  @override
  AddRecipesResponseRecipeModel rebuild(
          void Function(AddRecipesResponseRecipeModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddRecipesResponseRecipeModelBuilder toBuilder() =>
      new AddRecipesResponseRecipeModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddRecipesResponseRecipeModel &&
        id == other.id &&
        name == other.name &&
        ingredients == other.ingredients &&
        instructions == other.instructions &&
        raw == other.raw;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ingredients.hashCode);
    _$hash = $jc(_$hash, instructions.hashCode);
    _$hash = $jc(_$hash, raw.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddRecipesResponseRecipeModel')
          ..add('id', id)
          ..add('name', name)
          ..add('ingredients', ingredients)
          ..add('instructions', instructions)
          ..add('raw', raw))
        .toString();
  }
}

class AddRecipesResponseRecipeModelBuilder
    implements
        Builder<AddRecipesResponseRecipeModel,
            AddRecipesResponseRecipeModelBuilder> {
  _$AddRecipesResponseRecipeModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

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

  AddRecipesResponseRecipeModelBuilder() {
    AddRecipesResponseRecipeModel._defaults(this);
  }

  AddRecipesResponseRecipeModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _ingredients = $v.ingredients.toBuilder();
      _instructions = $v.instructions.toBuilder();
      _raw = $v.raw;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddRecipesResponseRecipeModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddRecipesResponseRecipeModel;
  }

  @override
  void update(void Function(AddRecipesResponseRecipeModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddRecipesResponseRecipeModel build() => _build();

  _$AddRecipesResponseRecipeModel _build() {
    _$AddRecipesResponseRecipeModel _$result;
    try {
      _$result = _$v ??
          new _$AddRecipesResponseRecipeModel._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'AddRecipesResponseRecipeModel', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'AddRecipesResponseRecipeModel', 'name'),
              ingredients: ingredients.build(),
              instructions: instructions.build(),
              raw: BuiltValueNullFieldError.checkNotNull(
                  raw, r'AddRecipesResponseRecipeModel', 'raw'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ingredients';
        ingredients.build();
        _$failedField = 'instructions';
        instructions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AddRecipesResponseRecipeModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
