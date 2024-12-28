// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_by_recipe_post_request_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatByRecipePostRequestModel extends ChatByRecipePostRequestModel {
  @override
  final int id;
  @override
  final BuiltList<ChatByRecipeMessageModel> messages;

  factory _$ChatByRecipePostRequestModel(
          [void Function(ChatByRecipePostRequestModelBuilder)? updates]) =>
      (new ChatByRecipePostRequestModelBuilder()..update(updates))._build();

  _$ChatByRecipePostRequestModel._({required this.id, required this.messages})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'ChatByRecipePostRequestModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        messages, r'ChatByRecipePostRequestModel', 'messages');
  }

  @override
  ChatByRecipePostRequestModel rebuild(
          void Function(ChatByRecipePostRequestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatByRecipePostRequestModelBuilder toBuilder() =>
      new ChatByRecipePostRequestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatByRecipePostRequestModel &&
        id == other.id &&
        messages == other.messages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, messages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatByRecipePostRequestModel')
          ..add('id', id)
          ..add('messages', messages))
        .toString();
  }
}

class ChatByRecipePostRequestModelBuilder
    implements
        Builder<ChatByRecipePostRequestModel,
            ChatByRecipePostRequestModelBuilder> {
  _$ChatByRecipePostRequestModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  ListBuilder<ChatByRecipeMessageModel>? _messages;
  ListBuilder<ChatByRecipeMessageModel> get messages =>
      _$this._messages ??= new ListBuilder<ChatByRecipeMessageModel>();
  set messages(ListBuilder<ChatByRecipeMessageModel>? messages) =>
      _$this._messages = messages;

  ChatByRecipePostRequestModelBuilder() {
    ChatByRecipePostRequestModel._defaults(this);
  }

  ChatByRecipePostRequestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _messages = $v.messages.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatByRecipePostRequestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatByRecipePostRequestModel;
  }

  @override
  void update(void Function(ChatByRecipePostRequestModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatByRecipePostRequestModel build() => _build();

  _$ChatByRecipePostRequestModel _build() {
    _$ChatByRecipePostRequestModel _$result;
    try {
      _$result = _$v ??
          new _$ChatByRecipePostRequestModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ChatByRecipePostRequestModel', 'id'),
            messages: messages.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'messages';
        messages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChatByRecipePostRequestModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
