// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_by_recipe_stream_content_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatByRecipeStreamContentModel extends ChatByRecipeStreamContentModel {
  @override
  final String text;

  factory _$ChatByRecipeStreamContentModel(
          [void Function(ChatByRecipeStreamContentModelBuilder)? updates]) =>
      (new ChatByRecipeStreamContentModelBuilder()..update(updates))._build();

  _$ChatByRecipeStreamContentModel._({required this.text}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        text, r'ChatByRecipeStreamContentModel', 'text');
  }

  @override
  ChatByRecipeStreamContentModel rebuild(
          void Function(ChatByRecipeStreamContentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatByRecipeStreamContentModelBuilder toBuilder() =>
      new ChatByRecipeStreamContentModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatByRecipeStreamContentModel && text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatByRecipeStreamContentModel')
          ..add('text', text))
        .toString();
  }
}

class ChatByRecipeStreamContentModelBuilder
    implements
        Builder<ChatByRecipeStreamContentModel,
            ChatByRecipeStreamContentModelBuilder> {
  _$ChatByRecipeStreamContentModel? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ChatByRecipeStreamContentModelBuilder() {
    ChatByRecipeStreamContentModel._defaults(this);
  }

  ChatByRecipeStreamContentModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatByRecipeStreamContentModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatByRecipeStreamContentModel;
  }

  @override
  void update(void Function(ChatByRecipeStreamContentModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatByRecipeStreamContentModel build() => _build();

  _$ChatByRecipeStreamContentModel _build() {
    final _$result = _$v ??
        new _$ChatByRecipeStreamContentModel._(
            text: BuiltValueNullFieldError.checkNotNull(
                text, r'ChatByRecipeStreamContentModel', 'text'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
