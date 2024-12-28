// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_recipes_post_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddRecipesPostResponseModel extends AddRecipesPostResponseModel {
  @override
  final BuiltList<AddRecipesResponseRecipeModel> recipes;

  factory _$AddRecipesPostResponseModel(
          [void Function(AddRecipesPostResponseModelBuilder)? updates]) =>
      (new AddRecipesPostResponseModelBuilder()..update(updates))._build();

  _$AddRecipesPostResponseModel._({required this.recipes}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        recipes, r'AddRecipesPostResponseModel', 'recipes');
  }

  @override
  AddRecipesPostResponseModel rebuild(
          void Function(AddRecipesPostResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddRecipesPostResponseModelBuilder toBuilder() =>
      new AddRecipesPostResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddRecipesPostResponseModel && recipes == other.recipes;
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
    return (newBuiltValueToStringHelper(r'AddRecipesPostResponseModel')
          ..add('recipes', recipes))
        .toString();
  }
}

class AddRecipesPostResponseModelBuilder
    implements
        Builder<AddRecipesPostResponseModel,
            AddRecipesPostResponseModelBuilder> {
  _$AddRecipesPostResponseModel? _$v;

  ListBuilder<AddRecipesResponseRecipeModel>? _recipes;
  ListBuilder<AddRecipesResponseRecipeModel> get recipes =>
      _$this._recipes ??= new ListBuilder<AddRecipesResponseRecipeModel>();
  set recipes(ListBuilder<AddRecipesResponseRecipeModel>? recipes) =>
      _$this._recipes = recipes;

  AddRecipesPostResponseModelBuilder() {
    AddRecipesPostResponseModel._defaults(this);
  }

  AddRecipesPostResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipes = $v.recipes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddRecipesPostResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddRecipesPostResponseModel;
  }

  @override
  void update(void Function(AddRecipesPostResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddRecipesPostResponseModel build() => _build();

  _$AddRecipesPostResponseModel _build() {
    _$AddRecipesPostResponseModel _$result;
    try {
      _$result = _$v ??
          new _$AddRecipesPostResponseModel._(
            recipes: recipes.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recipes';
        recipes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AddRecipesPostResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
