//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/user_profile_veggie_identity_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_user_profile_post_response_model.g.dart';

/// SetUserProfilePostResponseModel
///
/// Properties:
/// * [veggieIdentity] 
/// * [prefer] 
/// * [dislike] 
@BuiltValue()
abstract class SetUserProfilePostResponseModel implements Built<SetUserProfilePostResponseModel, SetUserProfilePostResponseModelBuilder> {
  @BuiltValueField(wireName: r'veggieIdentity')
  UserProfileVeggieIdentityModel get veggieIdentity;
  // enum veggieIdentityEnum {  None,  Vegetarian,  Vegan,  };

  @BuiltValueField(wireName: r'prefer')
  BuiltList<String> get prefer;

  @BuiltValueField(wireName: r'dislike')
  BuiltList<String> get dislike;

  SetUserProfilePostResponseModel._();

  factory SetUserProfilePostResponseModel([void updates(SetUserProfilePostResponseModelBuilder b)]) = _$SetUserProfilePostResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetUserProfilePostResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetUserProfilePostResponseModel> get serializer => _$SetUserProfilePostResponseModelSerializer();
}

class _$SetUserProfilePostResponseModelSerializer implements PrimitiveSerializer<SetUserProfilePostResponseModel> {
  @override
  final Iterable<Type> types = const [SetUserProfilePostResponseModel, _$SetUserProfilePostResponseModel];

  @override
  final String wireName = r'SetUserProfilePostResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetUserProfilePostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'veggieIdentity';
    yield serializers.serialize(
      object.veggieIdentity,
      specifiedType: const FullType(UserProfileVeggieIdentityModel),
    );
    yield r'prefer';
    yield serializers.serialize(
      object.prefer,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'dislike';
    yield serializers.serialize(
      object.dislike,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SetUserProfilePostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetUserProfilePostResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'veggieIdentity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserProfileVeggieIdentityModel),
          ) as UserProfileVeggieIdentityModel;
          result.veggieIdentity = valueDes;
          break;
        case r'prefer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.prefer.replace(valueDes);
          break;
        case r'dislike':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.dislike.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SetUserProfilePostResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetUserProfilePostResponseModelBuilder();
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

