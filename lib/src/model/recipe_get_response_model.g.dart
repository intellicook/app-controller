// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_get_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecipeGetResponseModel extends RecipeGetResponseModel {
  @override
  final String name;
  @override
  final BuiltList<String> ingredients;
  @override
  final BuiltList<String> instructions;

  factory _$RecipeGetResponseModel(
          [void Function(RecipeGetResponseModelBuilder)? updates]) =>
      (new RecipeGetResponseModelBuilder()..update(updates))._build();

  _$RecipeGetResponseModel._(
      {required this.name,
      required this.ingredients,
      required this.instructions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'RecipeGetResponseModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        ingredients, r'RecipeGetResponseModel', 'ingredients');
    BuiltValueNullFieldError.checkNotNull(
        instructions, r'RecipeGetResponseModel', 'instructions');
  }

  @override
  RecipeGetResponseModel rebuild(
          void Function(RecipeGetResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeGetResponseModelBuilder toBuilder() =>
      new RecipeGetResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeGetResponseModel &&
        name == other.name &&
        ingredients == other.ingredients &&
        instructions == other.instructions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ingredients.hashCode);
    _$hash = $jc(_$hash, instructions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeGetResponseModel')
          ..add('name', name)
          ..add('ingredients', ingredients)
          ..add('instructions', instructions))
        .toString();
  }
}

class RecipeGetResponseModelBuilder
    implements Builder<RecipeGetResponseModel, RecipeGetResponseModelBuilder> {
  _$RecipeGetResponseModel? _$v;

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

  RecipeGetResponseModelBuilder() {
    RecipeGetResponseModel._defaults(this);
  }

  RecipeGetResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ingredients = $v.ingredients.toBuilder();
      _instructions = $v.instructions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeGetResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeGetResponseModel;
  }

  @override
  void update(void Function(RecipeGetResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeGetResponseModel build() => _build();

  _$RecipeGetResponseModel _build() {
    _$RecipeGetResponseModel _$result;
    try {
      _$result = _$v ??
          new _$RecipeGetResponseModel._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'RecipeGetResponseModel', 'name'),
              ingredients: ingredients.build(),
              instructions: instructions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ingredients';
        ingredients.build();
        _$failedField = 'instructions';
        instructions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecipeGetResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
