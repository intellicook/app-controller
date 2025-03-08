// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_by_recipe_post_response_model_function_call.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatByRecipePostResponseModelFunctionCall
    extends ChatByRecipePostResponseModelFunctionCall {
  @override
  final OneOf oneOf;

  factory _$ChatByRecipePostResponseModelFunctionCall(
          [void Function(ChatByRecipePostResponseModelFunctionCallBuilder)?
              updates]) =>
      (new ChatByRecipePostResponseModelFunctionCallBuilder()..update(updates))
          ._build();

  _$ChatByRecipePostResponseModelFunctionCall._({required this.oneOf})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        oneOf, r'ChatByRecipePostResponseModelFunctionCall', 'oneOf');
  }

  @override
  ChatByRecipePostResponseModelFunctionCall rebuild(
          void Function(ChatByRecipePostResponseModelFunctionCallBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatByRecipePostResponseModelFunctionCallBuilder toBuilder() =>
      new ChatByRecipePostResponseModelFunctionCallBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatByRecipePostResponseModelFunctionCall &&
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
            r'ChatByRecipePostResponseModelFunctionCall')
          ..add('oneOf', oneOf))
        .toString();
  }
}

class ChatByRecipePostResponseModelFunctionCallBuilder
    implements
        Builder<ChatByRecipePostResponseModelFunctionCall,
            ChatByRecipePostResponseModelFunctionCallBuilder> {
  _$ChatByRecipePostResponseModelFunctionCall? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  ChatByRecipePostResponseModelFunctionCallBuilder() {
    ChatByRecipePostResponseModelFunctionCall._defaults(this);
  }

  ChatByRecipePostResponseModelFunctionCallBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatByRecipePostResponseModelFunctionCall other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatByRecipePostResponseModelFunctionCall;
  }

  @override
  void update(
      void Function(ChatByRecipePostResponseModelFunctionCallBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatByRecipePostResponseModelFunctionCall build() => _build();

  _$ChatByRecipePostResponseModelFunctionCall _build() {
    final _$result = _$v ??
        new _$ChatByRecipePostResponseModelFunctionCall._(
          oneOf: BuiltValueNullFieldError.checkNotNull(
              oneOf, r'ChatByRecipePostResponseModelFunctionCall', 'oneOf'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
