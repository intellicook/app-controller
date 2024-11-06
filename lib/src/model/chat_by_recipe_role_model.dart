//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_by_recipe_role_model.g.dart';

class ChatByRecipeRoleModel extends EnumClass {

  @BuiltValueEnumConst(wireName: r'System')
  static const ChatByRecipeRoleModel system = _$system;
  @BuiltValueEnumConst(wireName: r'User')
  static const ChatByRecipeRoleModel user = _$user;
  @BuiltValueEnumConst(wireName: r'Assistant')
  static const ChatByRecipeRoleModel assistant = _$assistant;

  static Serializer<ChatByRecipeRoleModel> get serializer => _$chatByRecipeRoleModelSerializer;

  const ChatByRecipeRoleModel._(String name): super(name);

  static BuiltSet<ChatByRecipeRoleModel> get values => _$values;
  static ChatByRecipeRoleModel valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ChatByRecipeRoleModelMixin = Object with _$ChatByRecipeRoleModelMixin;

