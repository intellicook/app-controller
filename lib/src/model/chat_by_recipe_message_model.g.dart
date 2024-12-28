// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_by_recipe_message_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatByRecipeMessageModel extends ChatByRecipeMessageModel {
  @override
  final ChatByRecipeRoleModel role;
  @override
  final String text;

  factory _$ChatByRecipeMessageModel(
          [void Function(ChatByRecipeMessageModelBuilder)? updates]) =>
      (new ChatByRecipeMessageModelBuilder()..update(updates))._build();

  _$ChatByRecipeMessageModel._({required this.role, required this.text})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        role, r'ChatByRecipeMessageModel', 'role');
    BuiltValueNullFieldError.checkNotNull(
        text, r'ChatByRecipeMessageModel', 'text');
  }

  @override
  ChatByRecipeMessageModel rebuild(
          void Function(ChatByRecipeMessageModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatByRecipeMessageModelBuilder toBuilder() =>
      new ChatByRecipeMessageModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatByRecipeMessageModel &&
        role == other.role &&
        text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatByRecipeMessageModel')
          ..add('role', role)
          ..add('text', text))
        .toString();
  }
}

class ChatByRecipeMessageModelBuilder
    implements
        Builder<ChatByRecipeMessageModel, ChatByRecipeMessageModelBuilder> {
  _$ChatByRecipeMessageModel? _$v;

  ChatByRecipeRoleModel? _role;
  ChatByRecipeRoleModel? get role => _$this._role;
  set role(ChatByRecipeRoleModel? role) => _$this._role = role;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ChatByRecipeMessageModelBuilder() {
    ChatByRecipeMessageModel._defaults(this);
  }

  ChatByRecipeMessageModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _role = $v.role;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatByRecipeMessageModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatByRecipeMessageModel;
  }

  @override
  void update(void Function(ChatByRecipeMessageModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatByRecipeMessageModel build() => _build();

  _$ChatByRecipeMessageModel _build() {
    final _$result = _$v ??
        new _$ChatByRecipeMessageModel._(
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'ChatByRecipeMessageModel', 'role'),
          text: BuiltValueNullFieldError.checkNotNull(
              text, r'ChatByRecipeMessageModel', 'text'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
