//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/search_recipes_recipe_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_post_response_model.g.dart';

/// SearchRecipesPostResponseModel
///
/// Properties:
/// * [recipes] 
@BuiltValue()
abstract class SearchRecipesPostResponseModel implements Built<SearchRecipesPostResponseModel, SearchRecipesPostResponseModelBuilder> {
  @BuiltValueField(wireName: r'recipes')
  BuiltList<SearchRecipesRecipeModel> get recipes;

  SearchRecipesPostResponseModel._();

  factory SearchRecipesPostResponseModel([void updates(SearchRecipesPostResponseModelBuilder b)]) = _$SearchRecipesPostResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchRecipesPostResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchRecipesPostResponseModel> get serializer => _$SearchRecipesPostResponseModelSerializer();
}

class _$SearchRecipesPostResponseModelSerializer implements PrimitiveSerializer<SearchRecipesPostResponseModel> {
  @override
  final Iterable<Type> types = const [SearchRecipesPostResponseModel, _$SearchRecipesPostResponseModel];

  @override
  final String wireName = r'SearchRecipesPostResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchRecipesPostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'recipes';
    yield serializers.serialize(
      object.recipes,
      specifiedType: const FullType(BuiltList, [FullType(SearchRecipesRecipeModel)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchRecipesPostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SearchRecipesPostResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'recipes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SearchRecipesRecipeModel)]),
          ) as BuiltList<SearchRecipesRecipeModel>;
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
  SearchRecipesPostResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchRecipesPostResponseModelBuilder();
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

