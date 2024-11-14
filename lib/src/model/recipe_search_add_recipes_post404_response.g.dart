// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_search_add_recipes_post404_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecipeSearchAddRecipesPost404Response
    extends RecipeSearchAddRecipesPost404Response {
  @override
  final OneOf oneOf;

  factory _$RecipeSearchAddRecipesPost404Response(
          [void Function(RecipeSearchAddRecipesPost404ResponseBuilder)?
              updates]) =>
      (new RecipeSearchAddRecipesPost404ResponseBuilder()..update(updates))
          ._build();

  _$RecipeSearchAddRecipesPost404Response._({required this.oneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        oneOf, r'RecipeSearchAddRecipesPost404Response', 'oneOf');
  }

  @override
  RecipeSearchAddRecipesPost404Response rebuild(
          void Function(RecipeSearchAddRecipesPost404ResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeSearchAddRecipesPost404ResponseBuilder toBuilder() =>
      new RecipeSearchAddRecipesPost404ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeSearchAddRecipesPost404Response &&
        oneOf == other.oneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'RecipeSearchAddRecipesPost404Response')
          ..add('oneOf', oneOf))
        .toString();
  }
}

class RecipeSearchAddRecipesPost404ResponseBuilder
    implements
        Builder<RecipeSearchAddRecipesPost404Response,
            RecipeSearchAddRecipesPost404ResponseBuilder> {
  _$RecipeSearchAddRecipesPost404Response? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  RecipeSearchAddRecipesPost404ResponseBuilder() {
    RecipeSearchAddRecipesPost404Response._defaults(this);
  }

  RecipeSearchAddRecipesPost404ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeSearchAddRecipesPost404Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeSearchAddRecipesPost404Response;
  }

  @override
  void update(
      void Function(RecipeSearchAddRecipesPost404ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeSearchAddRecipesPost404Response build() => _build();

  _$RecipeSearchAddRecipesPost404Response _build() {
    final _$result = _$v ??
        new _$RecipeSearchAddRecipesPost404Response._(
            oneOf: BuiltValueNullFieldError.checkNotNull(
                oneOf, r'RecipeSearchAddRecipesPost404Response', 'oneOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
