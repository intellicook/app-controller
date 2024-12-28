// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recognize_ingredients_post_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecognizeIngredientsPostResponseModel
    extends RecognizeIngredientsPostResponseModel {
  @override
  final BuiltList<RecognizeIngredientsIngredientModel> ingredients;

  factory _$RecognizeIngredientsPostResponseModel(
          [void Function(RecognizeIngredientsPostResponseModelBuilder)?
              updates]) =>
      (new RecognizeIngredientsPostResponseModelBuilder()..update(updates))
          ._build();

  _$RecognizeIngredientsPostResponseModel._({required this.ingredients})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ingredients, r'RecognizeIngredientsPostResponseModel', 'ingredients');
  }

  @override
  RecognizeIngredientsPostResponseModel rebuild(
          void Function(RecognizeIngredientsPostResponseModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecognizeIngredientsPostResponseModelBuilder toBuilder() =>
      new RecognizeIngredientsPostResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecognizeIngredientsPostResponseModel &&
        ingredients == other.ingredients;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ingredients.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'RecognizeIngredientsPostResponseModel')
          ..add('ingredients', ingredients))
        .toString();
  }
}

class RecognizeIngredientsPostResponseModelBuilder
    implements
        Builder<RecognizeIngredientsPostResponseModel,
            RecognizeIngredientsPostResponseModelBuilder> {
  _$RecognizeIngredientsPostResponseModel? _$v;

  ListBuilder<RecognizeIngredientsIngredientModel>? _ingredients;
  ListBuilder<RecognizeIngredientsIngredientModel> get ingredients =>
      _$this._ingredients ??=
          new ListBuilder<RecognizeIngredientsIngredientModel>();
  set ingredients(
          ListBuilder<RecognizeIngredientsIngredientModel>? ingredients) =>
      _$this._ingredients = ingredients;

  RecognizeIngredientsPostResponseModelBuilder() {
    RecognizeIngredientsPostResponseModel._defaults(this);
  }

  RecognizeIngredientsPostResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ingredients = $v.ingredients.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecognizeIngredientsPostResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecognizeIngredientsPostResponseModel;
  }

  @override
  void update(
      void Function(RecognizeIngredientsPostResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecognizeIngredientsPostResponseModel build() => _build();

  _$RecognizeIngredientsPostResponseModel _build() {
    _$RecognizeIngredientsPostResponseModel _$result;
    try {
      _$result = _$v ??
          new _$RecognizeIngredientsPostResponseModel._(
            ingredients: ingredients.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ingredients';
        ingredients.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecognizeIngredientsPostResponseModel',
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
