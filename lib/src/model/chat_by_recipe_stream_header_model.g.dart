// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_by_recipe_stream_header_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatByRecipeStreamHeaderModel extends ChatByRecipeStreamHeaderModel {
  @override
  final ChatByRecipeRoleModel role;

  factory _$ChatByRecipeStreamHeaderModel(
          [void Function(ChatByRecipeStreamHeaderModelBuilder)? updates]) =>
      (new ChatByRecipeStreamHeaderModelBuilder()..update(updates))._build();

  _$ChatByRecipeStreamHeaderModel._({required this.role}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        role, r'ChatByRecipeStreamHeaderModel', 'role');
  }

  @override
  ChatByRecipeStreamHeaderModel rebuild(
          void Function(ChatByRecipeStreamHeaderModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatByRecipeStreamHeaderModelBuilder toBuilder() =>
      new ChatByRecipeStreamHeaderModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatByRecipeStreamHeaderModel && role == other.role;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatByRecipeStreamHeaderModel')
          ..add('role', role))
        .toString();
  }
}

class ChatByRecipeStreamHeaderModelBuilder
    implements
        Builder<ChatByRecipeStreamHeaderModel,
            ChatByRecipeStreamHeaderModelBuilder> {
  _$ChatByRecipeStreamHeaderModel? _$v;

  ChatByRecipeRoleModel? _role;
  ChatByRecipeRoleModel? get role => _$this._role;
  set role(ChatByRecipeRoleModel? role) => _$this._role = role;

  ChatByRecipeStreamHeaderModelBuilder() {
    ChatByRecipeStreamHeaderModel._defaults(this);
  }

  ChatByRecipeStreamHeaderModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _role = $v.role;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatByRecipeStreamHeaderModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatByRecipeStreamHeaderModel;
  }

  @override
  void update(void Function(ChatByRecipeStreamHeaderModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatByRecipeStreamHeaderModel build() => _build();

  _$ChatByRecipeStreamHeaderModel _build() {
    final _$result = _$v ??
        new _$ChatByRecipeStreamHeaderModel._(
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'ChatByRecipeStreamHeaderModel', 'role'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
