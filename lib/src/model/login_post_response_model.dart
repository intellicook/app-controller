//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_post_response_model.g.dart';

/// LoginPostResponseModel
///
/// Properties:
/// * [accessToken] 
@BuiltValue()
abstract class LoginPostResponseModel implements Built<LoginPostResponseModel, LoginPostResponseModelBuilder> {
  @BuiltValueField(wireName: r'accessToken')
  String get accessToken;

  LoginPostResponseModel._();

  factory LoginPostResponseModel([void updates(LoginPostResponseModelBuilder b)]) = _$LoginPostResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginPostResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginPostResponseModel> get serializer => _$LoginPostResponseModelSerializer();
}

class _$LoginPostResponseModelSerializer implements PrimitiveSerializer<LoginPostResponseModel> {
  @override
  final Iterable<Type> types = const [LoginPostResponseModel, _$LoginPostResponseModel];

  @override
  final String wireName = r'LoginPostResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginPostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accessToken';
    yield serializers.serialize(
      object.accessToken,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LoginPostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LoginPostResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accessToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.accessToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LoginPostResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginPostResponseModelBuilder();
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

