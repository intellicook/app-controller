// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_by_recipe_role_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ChatByRecipeRoleModel _$system = const ChatByRecipeRoleModel._('system');
const ChatByRecipeRoleModel _$user = const ChatByRecipeRoleModel._('user');
const ChatByRecipeRoleModel _$assistant =
    const ChatByRecipeRoleModel._('assistant');

ChatByRecipeRoleModel _$valueOf(String name) {
  switch (name) {
    case 'system':
      return _$system;
    case 'user':
      return _$user;
    case 'assistant':
      return _$assistant;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ChatByRecipeRoleModel> _$values =
    new BuiltSet<ChatByRecipeRoleModel>(const <ChatByRecipeRoleModel>[
  _$system,
  _$user,
  _$assistant,
]);

class _$ChatByRecipeRoleModelMeta {
  const _$ChatByRecipeRoleModelMeta();
  ChatByRecipeRoleModel get system => _$system;
  ChatByRecipeRoleModel get user => _$user;
  ChatByRecipeRoleModel get assistant => _$assistant;
  ChatByRecipeRoleModel valueOf(String name) => _$valueOf(name);
  BuiltSet<ChatByRecipeRoleModel> get values => _$values;
}

abstract class _$ChatByRecipeRoleModelMixin {
  // ignore: non_constant_identifier_names
  _$ChatByRecipeRoleModelMeta get ChatByRecipeRoleModel =>
      const _$ChatByRecipeRoleModelMeta();
}

Serializer<ChatByRecipeRoleModel> _$chatByRecipeRoleModelSerializer =
    new _$ChatByRecipeRoleModelSerializer();

class _$ChatByRecipeRoleModelSerializer
    implements PrimitiveSerializer<ChatByRecipeRoleModel> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'system': 'System',
    'user': 'User',
    'assistant': 'Assistant',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'System': 'system',
    'User': 'user',
    'Assistant': 'assistant',
  };

  @override
  final Iterable<Type> types = const <Type>[ChatByRecipeRoleModel];
  @override
  final String wireName = 'ChatByRecipeRoleModel';

  @override
  Object serialize(Serializers serializers, ChatByRecipeRoleModel object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ChatByRecipeRoleModel deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ChatByRecipeRoleModel.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
