//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/recipe_nutrition_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/recipe_recipe_ingredient_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recipe_get_response_model.g.dart';

/// RecipeGetResponseModel
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [description] 
/// * [ingredients] 
/// * [directions] 
/// * [tips] 
/// * [utensils] 
/// * [nutrition] 
@BuiltValue()
abstract class RecipeGetResponseModel implements Built<RecipeGetResponseModel, RecipeGetResponseModelBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'ingredients')
  BuiltList<RecipeRecipeIngredientModel> get ingredients;

  @BuiltValueField(wireName: r'directions')
  BuiltList<String> get directions;

  @BuiltValueField(wireName: r'tips')
  BuiltList<String> get tips;

  @BuiltValueField(wireName: r'utensils')
  BuiltList<String> get utensils;

  @BuiltValueField(wireName: r'nutrition')
  RecipeNutritionModel get nutrition;

  RecipeGetResponseModel._();

  factory RecipeGetResponseModel([void updates(RecipeGetResponseModelBuilder b)]) = _$RecipeGetResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecipeGetResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecipeGetResponseModel> get serializer => _$RecipeGetResponseModelSerializer();
}

class _$RecipeGetResponseModelSerializer implements PrimitiveSerializer<RecipeGetResponseModel> {
  @override
  final Iterable<Type> types = const [RecipeGetResponseModel, _$RecipeGetResponseModel];

  @override
  final String wireName = r'RecipeGetResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecipeGetResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'ingredients';
    yield serializers.serialize(
      object.ingredients,
      specifiedType: const FullType(BuiltList, [FullType(RecipeRecipeIngredientModel)]),
    );
    yield r'directions';
    yield serializers.serialize(
      object.directions,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'tips';
    yield serializers.serialize(
      object.tips,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'utensils';
    yield serializers.serialize(
      object.utensils,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'nutrition';
    yield serializers.serialize(
      object.nutrition,
      specifiedType: const FullType(RecipeNutritionModel),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RecipeGetResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RecipeGetResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'ingredients':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(RecipeRecipeIngredientModel)]),
          ) as BuiltList<RecipeRecipeIngredientModel>;
          result.ingredients.replace(valueDes);
          break;
        case r'directions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.directions.replace(valueDes);
          break;
        case r'tips':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.tips.replace(valueDes);
          break;
        case r'utensils':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.utensils.replace(valueDes);
          break;
        case r'nutrition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RecipeNutritionModel),
          ) as RecipeNutritionModel;
          result.nutrition.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RecipeGetResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecipeGetResponseModelBuilder();
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

