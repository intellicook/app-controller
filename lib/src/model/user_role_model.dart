//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_role_model.g.dart';

class UserRoleModel extends EnumClass {

  @BuiltValueEnumConst(wireName: r'User')
  static const UserRoleModel user = _$user;
  @BuiltValueEnumConst(wireName: r'Admin')
  static const UserRoleModel admin = _$admin;

  static Serializer<UserRoleModel> get serializer => _$userRoleModelSerializer;

  const UserRoleModel._(String name): super(name);

  static BuiltSet<UserRoleModel> get values => _$values;
  static UserRoleModel valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class UserRoleModelMixin = Object with _$UserRoleModelMixin;

