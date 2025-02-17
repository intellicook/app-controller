//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/recipe_nutrition_value_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recipe_nutrition_model.g.dart';

/// RecipeNutritionModel
///
/// Properties:
/// * [calories] 
/// * [fat] 
/// * [protein] 
/// * [carbs] 
@BuiltValue()
abstract class RecipeNutritionModel implements Built<RecipeNutritionModel, RecipeNutritionModelBuilder> {
  @BuiltValueField(wireName: r'calories')
  RecipeNutritionValueModel get calories;
  // enum caloriesEnum {  High,  Medium,  Low,  None,  };

  @BuiltValueField(wireName: r'fat')
  RecipeNutritionValueModel get fat;
  // enum fatEnum {  High,  Medium,  Low,  None,  };

  @BuiltValueField(wireName: r'protein')
  RecipeNutritionValueModel get protein;
  // enum proteinEnum {  High,  Medium,  Low,  None,  };

  @BuiltValueField(wireName: r'carbs')
  RecipeNutritionValueModel get carbs;
  // enum carbsEnum {  High,  Medium,  Low,  None,  };

  RecipeNutritionModel._();

  factory RecipeNutritionModel([void updates(RecipeNutritionModelBuilder b)]) = _$RecipeNutritionModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecipeNutritionModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecipeNutritionModel> get serializer => _$RecipeNutritionModelSerializer();
}

class _$RecipeNutritionModelSerializer implements PrimitiveSerializer<RecipeNutritionModel> {
  @override
  final Iterable<Type> types = const [RecipeNutritionModel, _$RecipeNutritionModel];

  @override
  final String wireName = r'RecipeNutritionModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecipeNutritionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'calories';
    yield serializers.serialize(
      object.calories,
      specifiedType: const FullType(RecipeNutritionValueModel),
    );
    yield r'fat';
    yield serializers.serialize(
      object.fat,
      specifiedType: const FullType(RecipeNutritionValueModel),
    );
    yield r'protein';
    yield serializers.serialize(
      object.protein,
      specifiedType: const FullType(RecipeNutritionValueModel),
    );
    yield r'carbs';
    yield serializers.serialize(
      object.carbs,
      specifiedType: const FullType(RecipeNutritionValueModel),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RecipeNutritionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RecipeNutritionModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'calories':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RecipeNutritionValueModel),
          ) as RecipeNutritionValueModel;
          result.calories = valueDes;
          break;
        case r'fat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RecipeNutritionValueModel),
          ) as RecipeNutritionValueModel;
          result.fat = valueDes;
          break;
        case r'protein':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RecipeNutritionValueModel),
          ) as RecipeNutritionValueModel;
          result.protein = valueDes;
          break;
        case r'carbs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RecipeNutritionValueModel),
          ) as RecipeNutritionValueModel;
          result.carbs = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RecipeNutritionModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecipeNutritionModelBuilder();
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

