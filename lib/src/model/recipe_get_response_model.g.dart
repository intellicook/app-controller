// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_get_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecipeGetResponseModel extends RecipeGetResponseModel {
  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final BuiltList<RecipeRecipeIngredientModel> ingredients;
  @override
  final BuiltList<String> directions;
  @override
  final BuiltList<String> tips;
  @override
  final BuiltList<String> utensils;
  @override
  final RecipeNutritionModel nutrition;

  factory _$RecipeGetResponseModel(
          [void Function(RecipeGetResponseModelBuilder)? updates]) =>
      (new RecipeGetResponseModelBuilder()..update(updates))._build();

  _$RecipeGetResponseModel._(
      {required this.id,
      required this.title,
      required this.description,
      required this.ingredients,
      required this.directions,
      required this.tips,
      required this.utensils,
      required this.nutrition})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'RecipeGetResponseModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'RecipeGetResponseModel', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'RecipeGetResponseModel', 'description');
    BuiltValueNullFieldError.checkNotNull(
        ingredients, r'RecipeGetResponseModel', 'ingredients');
    BuiltValueNullFieldError.checkNotNull(
        directions, r'RecipeGetResponseModel', 'directions');
    BuiltValueNullFieldError.checkNotNull(
        tips, r'RecipeGetResponseModel', 'tips');
    BuiltValueNullFieldError.checkNotNull(
        utensils, r'RecipeGetResponseModel', 'utensils');
    BuiltValueNullFieldError.checkNotNull(
        nutrition, r'RecipeGetResponseModel', 'nutrition');
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
        id == other.id &&
        title == other.title &&
        description == other.description &&
        ingredients == other.ingredients &&
        directions == other.directions &&
        tips == other.tips &&
        utensils == other.utensils &&
        nutrition == other.nutrition;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, ingredients.hashCode);
    _$hash = $jc(_$hash, directions.hashCode);
    _$hash = $jc(_$hash, tips.hashCode);
    _$hash = $jc(_$hash, utensils.hashCode);
    _$hash = $jc(_$hash, nutrition.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeGetResponseModel')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('ingredients', ingredients)
          ..add('directions', directions)
          ..add('tips', tips)
          ..add('utensils', utensils)
          ..add('nutrition', nutrition))
        .toString();
  }
}

class RecipeGetResponseModelBuilder
    implements Builder<RecipeGetResponseModel, RecipeGetResponseModelBuilder> {
  _$RecipeGetResponseModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<RecipeRecipeIngredientModel>? _ingredients;
  ListBuilder<RecipeRecipeIngredientModel> get ingredients =>
      _$this._ingredients ??= new ListBuilder<RecipeRecipeIngredientModel>();
  set ingredients(ListBuilder<RecipeRecipeIngredientModel>? ingredients) =>
      _$this._ingredients = ingredients;

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

  RecipeGetResponseModelBuilder() {
    RecipeGetResponseModel._defaults(this);
  }

  RecipeGetResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _ingredients = $v.ingredients.toBuilder();
      _directions = $v.directions.toBuilder();
      _tips = $v.tips.toBuilder();
      _utensils = $v.utensils.toBuilder();
      _nutrition = $v.nutrition.toBuilder();
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
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'RecipeGetResponseModel', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'RecipeGetResponseModel', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'RecipeGetResponseModel', 'description'),
            ingredients: ingredients.build(),
            directions: directions.build(),
            tips: tips.build(),
            utensils: utensils.build(),
            nutrition: nutrition.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ingredients';
        ingredients.build();
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
            r'RecipeGetResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
