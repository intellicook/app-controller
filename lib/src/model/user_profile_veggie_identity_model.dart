//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_profile_veggie_identity_model.g.dart';

class UserProfileVeggieIdentityModel extends EnumClass {

  @BuiltValueEnumConst(wireName: r'None')
  static const UserProfileVeggieIdentityModel none = _$none;
  @BuiltValueEnumConst(wireName: r'Vegetarian')
  static const UserProfileVeggieIdentityModel vegetarian = _$vegetarian;
  @BuiltValueEnumConst(wireName: r'Vegan')
  static const UserProfileVeggieIdentityModel vegan = _$vegan;

  static Serializer<UserProfileVeggieIdentityModel> get serializer => _$userProfileVeggieIdentityModelSerializer;

  const UserProfileVeggieIdentityModel._(String name): super(name);

  static BuiltSet<UserProfileVeggieIdentityModel> get values => _$values;
  static UserProfileVeggieIdentityModel valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class UserProfileVeggieIdentityModelMixin = Object with _$UserProfileVeggieIdentityModelMixin;

