// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_recipes_request_recipe_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddRecipesRequestRecipeModel extends AddRecipesRequestRecipeModel {
  @override
  final String name;
  @override
  final BuiltList<String> ingredients;
  @override
  final BuiltList<String> instructions;
  @override
  final String? raw;

  factory _$AddRecipesRequestRecipeModel(
          [void Function(AddRecipesRequestRecipeModelBuilder)? updates]) =>
      (new AddRecipesRequestRecipeModelBuilder()..update(updates))._build();

  _$AddRecipesRequestRecipeModel._(
      {required this.name,
      required this.ingredients,
      required this.instructions,
      this.raw})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'AddRecipesRequestRecipeModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        ingredients, r'AddRecipesRequestRecipeModel', 'ingredients');
    BuiltValueNullFieldError.checkNotNull(
        instructions, r'AddRecipesRequestRecipeModel', 'instructions');
  }

  @override
  AddRecipesRequestRecipeModel rebuild(
          void Function(AddRecipesRequestRecipeModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddRecipesRequestRecipeModelBuilder toBuilder() =>
      new AddRecipesRequestRecipeModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddRecipesRequestRecipeModel &&
        name == other.name &&
        ingredients == other.ingredients &&
        instructions == other.instructions &&
        raw == other.raw;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ingredients.hashCode);
    _$hash = $jc(_$hash, instructions.hashCode);
    _$hash = $jc(_$hash, raw.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddRecipesRequestRecipeModel')
          ..add('name', name)
          ..add('ingredients', ingredients)
          ..add('instructions', instructions)
          ..add('raw', raw))
        .toString();
  }
}

class AddRecipesRequestRecipeModelBuilder
    implements
        Builder<AddRecipesRequestRecipeModel,
            AddRecipesRequestRecipeModelBuilder> {
  _$AddRecipesRequestRecipeModel? _$v;

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

  AddRecipesRequestRecipeModelBuilder() {
    AddRecipesRequestRecipeModel._defaults(this);
  }

  AddRecipesRequestRecipeModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ingredients = $v.ingredients.toBuilder();
      _instructions = $v.instructions.toBuilder();
      _raw = $v.raw;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddRecipesRequestRecipeModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddRecipesRequestRecipeModel;
  }

  @override
  void update(void Function(AddRecipesRequestRecipeModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddRecipesRequestRecipeModel build() => _build();

  _$AddRecipesRequestRecipeModel _build() {
    _$AddRecipesRequestRecipeModel _$result;
    try {
      _$result = _$v ??
          new _$AddRecipesRequestRecipeModel._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'AddRecipesRequestRecipeModel', 'name'),
            ingredients: ingredients.build(),
            instructions: instructions.build(),
            raw: raw,
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
            r'AddRecipesRequestRecipeModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
