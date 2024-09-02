//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_password_put_request_model.g.dart';

/// UserPasswordPutRequestModel
///
/// Properties:
/// * [oldPassword] 
/// * [newPassword] 
@BuiltValue()
abstract class UserPasswordPutRequestModel implements Built<UserPasswordPutRequestModel, UserPasswordPutRequestModelBuilder> {
  @BuiltValueField(wireName: r'oldPassword')
  String get oldPassword;

  @BuiltValueField(wireName: r'newPassword')
  String get newPassword;

  UserPasswordPutRequestModel._();

  factory UserPasswordPutRequestModel([void updates(UserPasswordPutRequestModelBuilder b)]) = _$UserPasswordPutRequestModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserPasswordPutRequestModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserPasswordPutRequestModel> get serializer => _$UserPasswordPutRequestModelSerializer();
}

class _$UserPasswordPutRequestModelSerializer implements PrimitiveSerializer<UserPasswordPutRequestModel> {
  @override
  final Iterable<Type> types = const [UserPasswordPutRequestModel, _$UserPasswordPutRequestModel];

  @override
  final String wireName = r'UserPasswordPutRequestModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserPasswordPutRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'oldPassword';
    yield serializers.serialize(
      object.oldPassword,
      specifiedType: const FullType(String),
    );
    yield r'newPassword';
    yield serializers.serialize(
      object.newPassword,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserPasswordPutRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserPasswordPutRequestModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'oldPassword':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.oldPassword = valueDes;
          break;
        case r'newPassword':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.newPassword = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserPasswordPutRequestModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserPasswordPutRequestModelBuilder();
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

