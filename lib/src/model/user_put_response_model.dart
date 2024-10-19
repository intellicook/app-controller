//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_put_response_model.g.dart';

/// UserPutResponseModel
///
/// Properties:
/// * [accessToken] 
@BuiltValue()
abstract class UserPutResponseModel implements Built<UserPutResponseModel, UserPutResponseModelBuilder> {
  @BuiltValueField(wireName: r'accessToken')
  String get accessToken;

  UserPutResponseModel._();

  factory UserPutResponseModel([void updates(UserPutResponseModelBuilder b)]) = _$UserPutResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserPutResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserPutResponseModel> get serializer => _$UserPutResponseModelSerializer();
}

class _$UserPutResponseModelSerializer implements PrimitiveSerializer<UserPutResponseModel> {
  @override
  final Iterable<Type> types = const [UserPutResponseModel, _$UserPutResponseModel];

  @override
  final String wireName = r'UserPutResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserPutResponseModel object, {
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
    UserPutResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserPutResponseModelBuilder result,
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
  UserPutResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserPutResponseModelBuilder();
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

