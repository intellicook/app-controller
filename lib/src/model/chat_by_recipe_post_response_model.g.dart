// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_by_recipe_post_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatByRecipePostResponseModel extends ChatByRecipePostResponseModel {
  @override
  final ChatByRecipeMessageModel message;

  factory _$ChatByRecipePostResponseModel(
          [void Function(ChatByRecipePostResponseModelBuilder)? updates]) =>
      (new ChatByRecipePostResponseModelBuilder()..update(updates))._build();

  _$ChatByRecipePostResponseModel._({required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'ChatByRecipePostResponseModel', 'message');
  }

  @override
  ChatByRecipePostResponseModel rebuild(
          void Function(ChatByRecipePostResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatByRecipePostResponseModelBuilder toBuilder() =>
      new ChatByRecipePostResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatByRecipePostResponseModel && message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatByRecipePostResponseModel')
          ..add('message', message))
        .toString();
  }
}

class ChatByRecipePostResponseModelBuilder
    implements
        Builder<ChatByRecipePostResponseModel,
            ChatByRecipePostResponseModelBuilder> {
  _$ChatByRecipePostResponseModel? _$v;

  ChatByRecipeMessageModelBuilder? _message;
  ChatByRecipeMessageModelBuilder get message =>
      _$this._message ??= new ChatByRecipeMessageModelBuilder();
  set message(ChatByRecipeMessageModelBuilder? message) =>
      _$this._message = message;

  ChatByRecipePostResponseModelBuilder() {
    ChatByRecipePostResponseModel._defaults(this);
  }

  ChatByRecipePostResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatByRecipePostResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatByRecipePostResponseModel;
  }

  @override
  void update(void Function(ChatByRecipePostResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatByRecipePostResponseModel build() => _build();

  _$ChatByRecipePostResponseModel _build() {
    _$ChatByRecipePostResponseModel _$result;
    try {
      _$result = _$v ??
          new _$ChatByRecipePostResponseModel._(
            message: message.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'message';
        message.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChatByRecipePostResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
