//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/recipe_nutrition_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_recipe_detail_model.g.dart';

/// SearchRecipesRecipeDetailModel
///
/// Properties:
/// * [directions] 
/// * [tips] 
/// * [utensils] 
/// * [nutrition] 
@BuiltValue()
abstract class SearchRecipesRecipeDetailModel implements Built<SearchRecipesRecipeDetailModel, SearchRecipesRecipeDetailModelBuilder> {
  @BuiltValueField(wireName: r'directions')
  BuiltList<String> get directions;

  @BuiltValueField(wireName: r'tips')
  BuiltList<String> get tips;

  @BuiltValueField(wireName: r'utensils')
  BuiltList<String> get utensils;

  @BuiltValueField(wireName: r'nutrition')
  RecipeNutritionModel get nutrition;

  SearchRecipesRecipeDetailModel._();

  factory SearchRecipesRecipeDetailModel([void updates(SearchRecipesRecipeDetailModelBuilder b)]) = _$SearchRecipesRecipeDetailModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchRecipesRecipeDetailModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchRecipesRecipeDetailModel> get serializer => _$SearchRecipesRecipeDetailModelSerializer();
}

class _$SearchRecipesRecipeDetailModelSerializer implements PrimitiveSerializer<SearchRecipesRecipeDetailModel> {
  @override
  final Iterable<Type> types = const [SearchRecipesRecipeDetailModel, _$SearchRecipesRecipeDetailModel];

  @override
  final String wireName = r'SearchRecipesRecipeDetailModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchRecipesRecipeDetailModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    SearchRecipesRecipeDetailModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SearchRecipesRecipeDetailModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  SearchRecipesRecipeDetailModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchRecipesRecipeDetailModelBuilder();
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

