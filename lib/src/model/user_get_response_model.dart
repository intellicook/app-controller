//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/user_role_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_get_response_model.g.dart';

/// UserGetResponseModel
///
/// Properties:
/// * [name] 
/// * [role] 
/// * [username] 
/// * [email] 
@BuiltValue()
abstract class UserGetResponseModel implements Built<UserGetResponseModel, UserGetResponseModelBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'role')
  UserRoleModel get role;
  // enum roleEnum {  User,  Admin,  };

  @BuiltValueField(wireName: r'username')
  String get username;

  @BuiltValueField(wireName: r'email')
  String get email;

  UserGetResponseModel._();

  factory UserGetResponseModel([void updates(UserGetResponseModelBuilder b)]) = _$UserGetResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserGetResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserGetResponseModel> get serializer => _$UserGetResponseModelSerializer();
}

class _$UserGetResponseModelSerializer implements PrimitiveSerializer<UserGetResponseModel> {
  @override
  final Iterable<Type> types = const [UserGetResponseModel, _$UserGetResponseModel];

  @override
  final String wireName = r'UserGetResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserGetResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(UserRoleModel),
    );
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserGetResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserGetResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserRoleModel),
          ) as UserRoleModel;
          result.role = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserGetResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserGetResponseModelBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

