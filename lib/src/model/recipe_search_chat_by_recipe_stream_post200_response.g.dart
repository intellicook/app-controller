// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_search_chat_by_recipe_stream_post200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecipeSearchChatByRecipeStreamPost200Response
    extends RecipeSearchChatByRecipeStreamPost200Response {
  @override
  final OneOf oneOf;

  factory _$RecipeSearchChatByRecipeStreamPost200Response(
          [void Function(RecipeSearchChatByRecipeStreamPost200ResponseBuilder)?
              updates]) =>
      (new RecipeSearchChatByRecipeStreamPost200ResponseBuilder()
            ..update(updates))
          ._build();

  _$RecipeSearchChatByRecipeStreamPost200Response._({required this.oneOf})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        oneOf, r'RecipeSearchChatByRecipeStreamPost200Response', 'oneOf');
  }

  @override
  RecipeSearchChatByRecipeStreamPost200Response rebuild(
          void Function(RecipeSearchChatByRecipeStreamPost200ResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeSearchChatByRecipeStreamPost200ResponseBuilder toBuilder() =>
      new RecipeSearchChatByRecipeStreamPost200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeSearchChatByRecipeStreamPost200Response &&
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
            r'RecipeSearchChatByRecipeStreamPost200Response')
          ..add('oneOf', oneOf))
        .toString();
  }
}

class RecipeSearchChatByRecipeStreamPost200ResponseBuilder
    implements
        Builder<RecipeSearchChatByRecipeStreamPost200Response,
            RecipeSearchChatByRecipeStreamPost200ResponseBuilder> {
  _$RecipeSearchChatByRecipeStreamPost200Response? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  RecipeSearchChatByRecipeStreamPost200ResponseBuilder() {
    RecipeSearchChatByRecipeStreamPost200Response._defaults(this);
  }

  RecipeSearchChatByRecipeStreamPost200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeSearchChatByRecipeStreamPost200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeSearchChatByRecipeStreamPost200Response;
  }

  @override
  void update(
      void Function(RecipeSearchChatByRecipeStreamPost200ResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeSearchChatByRecipeStreamPost200Response build() => _build();

  _$RecipeSearchChatByRecipeStreamPost200Response _build() {
    final _$result = _$v ??
        new _$RecipeSearchChatByRecipeStreamPost200Response._(
          oneOf: BuiltValueNullFieldError.checkNotNull(
              oneOf, r'RecipeSearchChatByRecipeStreamPost200Response', 'oneOf'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
