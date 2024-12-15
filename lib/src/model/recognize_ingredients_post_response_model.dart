//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/recognize_ingredients_ingredient_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recognize_ingredients_post_response_model.g.dart';

/// RecognizeIngredientsPostResponseModel
///
/// Properties:
/// * [ingredients] 
@BuiltValue()
abstract class RecognizeIngredientsPostResponseModel implements Built<RecognizeIngredientsPostResponseModel, RecognizeIngredientsPostResponseModelBuilder> {
  @BuiltValueField(wireName: r'ingredients')
  BuiltList<RecognizeIngredientsIngredientModel> get ingredients;

  RecognizeIngredientsPostResponseModel._();

  factory RecognizeIngredientsPostResponseModel([void updates(RecognizeIngredientsPostResponseModelBuilder b)]) = _$RecognizeIngredientsPostResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecognizeIngredientsPostResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecognizeIngredientsPostResponseModel> get serializer => _$RecognizeIngredientsPostResponseModelSerializer();
}

class _$RecognizeIngredientsPostResponseModelSerializer implements PrimitiveSerializer<RecognizeIngredientsPostResponseModel> {
  @override
  final Iterable<Type> types = const [RecognizeIngredientsPostResponseModel, _$RecognizeIngredientsPostResponseModel];

  @override
  final String wireName = r'RecognizeIngredientsPostResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecognizeIngredientsPostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'ingredients';
    yield serializers.serialize(
      object.ingredients,
      specifiedType: const FullType(BuiltList, [FullType(RecognizeIngredientsIngredientModel)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RecognizeIngredientsPostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RecognizeIngredientsPostResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ingredients':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(RecognizeIngredientsIngredientModel)]),
          ) as BuiltList<RecognizeIngredientsIngredientModel>;
          result.ingredients.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RecognizeIngredientsPostResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecognizeIngredientsPostResponseModelBuilder();
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

