//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/search_recipes_by_ingredients_recipe_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_by_ingredients_post_response_model.g.dart';

/// SearchRecipesByIngredientsPostResponseModel
///
/// Properties:
/// * [recipes] 
@BuiltValue()
abstract class SearchRecipesByIngredientsPostResponseModel implements Built<SearchRecipesByIngredientsPostResponseModel, SearchRecipesByIngredientsPostResponseModelBuilder> {
  @BuiltValueField(wireName: r'recipes')
  BuiltList<SearchRecipesByIngredientsRecipeModel> get recipes;

  SearchRecipesByIngredientsPostResponseModel._();

  factory SearchRecipesByIngredientsPostResponseModel([void updates(SearchRecipesByIngredientsPostResponseModelBuilder b)]) = _$SearchRecipesByIngredientsPostResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchRecipesByIngredientsPostResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchRecipesByIngredientsPostResponseModel> get serializer => _$SearchRecipesByIngredientsPostResponseModelSerializer();
}

class _$SearchRecipesByIngredientsPostResponseModelSerializer implements PrimitiveSerializer<SearchRecipesByIngredientsPostResponseModel> {
  @override
  final Iterable<Type> types = const [SearchRecipesByIngredientsPostResponseModel, _$SearchRecipesByIngredientsPostResponseModel];

  @override
  final String wireName = r'SearchRecipesByIngredientsPostResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchRecipesByIngredientsPostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'recipes';
    yield serializers.serialize(
      object.recipes,
      specifiedType: const FullType(BuiltList, [FullType(SearchRecipesByIngredientsRecipeModel)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchRecipesByIngredientsPostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SearchRecipesByIngredientsPostResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'recipes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SearchRecipesByIngredientsRecipeModel)]),
          ) as BuiltList<SearchRecipesByIngredientsRecipeModel>;
          result.recipes.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SearchRecipesByIngredientsPostResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchRecipesByIngredientsPostResponseModelBuilder();
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

