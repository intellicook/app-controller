//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/search_recipes_match_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/search_recipes_recipe_detail_model.dart';
import 'package:app_controller_client/src/model/search_recipes_recipe_ingredient_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_recipe_model.g.dart';

/// SearchRecipesRecipeModel
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [description] 
/// * [ingredients] 
/// * [matches] 
/// * [detail] 
@BuiltValue()
abstract class SearchRecipesRecipeModel implements Built<SearchRecipesRecipeModel, SearchRecipesRecipeModelBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'ingredients')
  BuiltList<SearchRecipesRecipeIngredientModel> get ingredients;

  @BuiltValueField(wireName: r'matches')
  BuiltList<SearchRecipesMatchModel> get matches;

  @BuiltValueField(wireName: r'detail')
  SearchRecipesRecipeDetailModel? get detail;

  SearchRecipesRecipeModel._();

  factory SearchRecipesRecipeModel([void updates(SearchRecipesRecipeModelBuilder b)]) = _$SearchRecipesRecipeModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchRecipesRecipeModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchRecipesRecipeModel> get serializer => _$SearchRecipesRecipeModelSerializer();
}

class _$SearchRecipesRecipeModelSerializer implements PrimitiveSerializer<SearchRecipesRecipeModel> {
  @override
  final Iterable<Type> types = const [SearchRecipesRecipeModel, _$SearchRecipesRecipeModel];

  @override
  final String wireName = r'SearchRecipesRecipeModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchRecipesRecipeModel object, {
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
      specifiedType: const FullType(BuiltList, [FullType(SearchRecipesRecipeIngredientModel)]),
    );
    yield r'matches';
    yield serializers.serialize(
      object.matches,
      specifiedType: const FullType(BuiltList, [FullType(SearchRecipesMatchModel)]),
    );
    if (object.detail != null) {
      yield r'detail';
      yield serializers.serialize(
        object.detail,
        specifiedType: const FullType(SearchRecipesRecipeDetailModel),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchRecipesRecipeModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SearchRecipesRecipeModelBuilder result,
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
            specifiedType: const FullType(BuiltList, [FullType(SearchRecipesRecipeIngredientModel)]),
          ) as BuiltList<SearchRecipesRecipeIngredientModel>;
          result.ingredients.replace(valueDes);
          break;
        case r'matches':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SearchRecipesMatchModel)]),
          ) as BuiltList<SearchRecipesMatchModel>;
          result.matches.replace(valueDes);
          break;
        case r'detail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SearchRecipesRecipeDetailModel),
          ) as SearchRecipesRecipeDetailModel;
          result.detail.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SearchRecipesRecipeModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchRecipesRecipeModelBuilder();
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

