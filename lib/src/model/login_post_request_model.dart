//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_post_request_model.g.dart';

/// LoginPostRequestModel
///
/// Properties:
/// * [username] 
/// * [password] 
@BuiltValue()
abstract class LoginPostRequestModel implements Built<LoginPostRequestModel, LoginPostRequestModelBuilder> {
  @BuiltValueField(wireName: r'username')
  String get username;

  @BuiltValueField(wireName: r'password')
  String get password;

  LoginPostRequestModel._();

  factory LoginPostRequestModel([void updates(LoginPostRequestModelBuilder b)]) = _$LoginPostRequestModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginPostRequestModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginPostRequestModel> get serializer => _$LoginPostRequestModelSerializer();
}

class _$LoginPostRequestModelSerializer implements PrimitiveSerializer<LoginPostRequestModel> {
  @override
  final Iterable<Type> types = const [LoginPostRequestModel, _$LoginPostRequestModel];

  @override
  final String wireName = r'LoginPostRequestModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginPostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
    yield r'password';
    yield serializers.serialize(
      object.password,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LoginPostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LoginPostRequestModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LoginPostRequestModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginPostRequestModelBuilder();
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

