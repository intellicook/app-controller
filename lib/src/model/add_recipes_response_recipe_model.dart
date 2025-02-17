//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/add_recipes_recipe_ingredient_model.dart';
import 'package:app_controller_client/src/model/recipe_nutrition_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_recipes_response_recipe_model.g.dart';

/// AddRecipesResponseRecipeModel
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
abstract class AddRecipesResponseRecipeModel implements Built<AddRecipesResponseRecipeModel, AddRecipesResponseRecipeModelBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'ingredients')
  BuiltList<AddRecipesRecipeIngredientModel> get ingredients;

  @BuiltValueField(wireName: r'directions')
  BuiltList<String> get directions;

  @BuiltValueField(wireName: r'tips')
  BuiltList<String> get tips;

  @BuiltValueField(wireName: r'utensils')
  BuiltList<String> get utensils;

  @BuiltValueField(wireName: r'nutrition')
  RecipeNutritionModel get nutrition;

  AddRecipesResponseRecipeModel._();

  factory AddRecipesResponseRecipeModel([void updates(AddRecipesResponseRecipeModelBuilder b)]) = _$AddRecipesResponseRecipeModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddRecipesResponseRecipeModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddRecipesResponseRecipeModel> get serializer => _$AddRecipesResponseRecipeModelSerializer();
}

class _$AddRecipesResponseRecipeModelSerializer implements PrimitiveSerializer<AddRecipesResponseRecipeModel> {
  @override
  final Iterable<Type> types = const [AddRecipesResponseRecipeModel, _$AddRecipesResponseRecipeModel];

  @override
  final String wireName = r'AddRecipesResponseRecipeModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddRecipesResponseRecipeModel object, {
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
      specifiedType: const FullType(BuiltList, [FullType(AddRecipesRecipeIngredientModel)]),
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
    AddRecipesResponseRecipeModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddRecipesResponseRecipeModelBuilder result,
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
            specifiedType: const FullType(BuiltList, [FullType(AddRecipesRecipeIngredientModel)]),
          ) as BuiltList<AddRecipesRecipeIngredientModel>;
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
  AddRecipesResponseRecipeModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddRecipesResponseRecipeModelBuilder();
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

