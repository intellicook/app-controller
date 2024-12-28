// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_recipes_post_request_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddRecipesPostRequestModel extends AddRecipesPostRequestModel {
  @override
  final BuiltList<AddRecipesRequestRecipeModel> recipes;

  factory _$AddRecipesPostRequestModel(
          [void Function(AddRecipesPostRequestModelBuilder)? updates]) =>
      (new AddRecipesPostRequestModelBuilder()..update(updates))._build();

  _$AddRecipesPostRequestModel._({required this.recipes}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        recipes, r'AddRecipesPostRequestModel', 'recipes');
  }

  @override
  AddRecipesPostRequestModel rebuild(
          void Function(AddRecipesPostRequestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddRecipesPostRequestModelBuilder toBuilder() =>
      new AddRecipesPostRequestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddRecipesPostRequestModel && recipes == other.recipes;
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
    return (newBuiltValueToStringHelper(r'AddRecipesPostRequestModel')
          ..add('recipes', recipes))
        .toString();
  }
}

class AddRecipesPostRequestModelBuilder
    implements
        Builder<AddRecipesPostRequestModel, AddRecipesPostRequestModelBuilder> {
  _$AddRecipesPostRequestModel? _$v;

  ListBuilder<AddRecipesRequestRecipeModel>? _recipes;
  ListBuilder<AddRecipesRequestRecipeModel> get recipes =>
      _$this._recipes ??= new ListBuilder<AddRecipesRequestRecipeModel>();
  set recipes(ListBuilder<AddRecipesRequestRecipeModel>? recipes) =>
      _$this._recipes = recipes;

  AddRecipesPostRequestModelBuilder() {
    AddRecipesPostRequestModel._defaults(this);
  }

  AddRecipesPostRequestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipes = $v.recipes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddRecipesPostRequestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddRecipesPostRequestModel;
  }

  @override
  void update(void Function(AddRecipesPostRequestModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddRecipesPostRequestModel build() => _build();

  _$AddRecipesPostRequestModel _build() {
    _$AddRecipesPostRequestModel _$result;
    try {
      _$result = _$v ??
          new _$AddRecipesPostRequestModel._(
            recipes: recipes.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recipes';
        recipes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AddRecipesPostRequestModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
