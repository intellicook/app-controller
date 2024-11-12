// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_recipe_detail_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchRecipesRecipeDetailModel extends SearchRecipesRecipeDetailModel {
  @override
  final BuiltList<String> instructions;
  @override
  final String raw;

  factory _$SearchRecipesRecipeDetailModel(
          [void Function(SearchRecipesRecipeDetailModelBuilder)? updates]) =>
      (new SearchRecipesRecipeDetailModelBuilder()..update(updates))._build();

  _$SearchRecipesRecipeDetailModel._(
      {required this.instructions, required this.raw})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        instructions, r'SearchRecipesRecipeDetailModel', 'instructions');
    BuiltValueNullFieldError.checkNotNull(
        raw, r'SearchRecipesRecipeDetailModel', 'raw');
  }

  @override
  SearchRecipesRecipeDetailModel rebuild(
          void Function(SearchRecipesRecipeDetailModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRecipesRecipeDetailModelBuilder toBuilder() =>
      new SearchRecipesRecipeDetailModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRecipesRecipeDetailModel &&
        instructions == other.instructions &&
        raw == other.raw;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, instructions.hashCode);
    _$hash = $jc(_$hash, raw.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchRecipesRecipeDetailModel')
          ..add('instructions', instructions)
          ..add('raw', raw))
        .toString();
  }
}

class SearchRecipesRecipeDetailModelBuilder
    implements
        Builder<SearchRecipesRecipeDetailModel,
            SearchRecipesRecipeDetailModelBuilder> {
  _$SearchRecipesRecipeDetailModel? _$v;

  ListBuilder<String>? _instructions;
  ListBuilder<String> get instructions =>
      _$this._instructions ??= new ListBuilder<String>();
  set instructions(ListBuilder<String>? instructions) =>
      _$this._instructions = instructions;

  String? _raw;
  String? get raw => _$this._raw;
  set raw(String? raw) => _$this._raw = raw;

  SearchRecipesRecipeDetailModelBuilder() {
    SearchRecipesRecipeDetailModel._defaults(this);
  }

  SearchRecipesRecipeDetailModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _instructions = $v.instructions.toBuilder();
      _raw = $v.raw;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchRecipesRecipeDetailModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRecipesRecipeDetailModel;
  }

  @override
  void update(void Function(SearchRecipesRecipeDetailModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRecipesRecipeDetailModel build() => _build();

  _$SearchRecipesRecipeDetailModel _build() {
    _$SearchRecipesRecipeDetailModel _$result;
    try {
      _$result = _$v ??
          new _$SearchRecipesRecipeDetailModel._(
              instructions: instructions.build(),
              raw: BuiltValueNullFieldError.checkNotNull(
                  raw, r'SearchRecipesRecipeDetailModel', 'raw'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'instructions';
        instructions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchRecipesRecipeDetailModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
