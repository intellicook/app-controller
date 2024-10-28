//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_by_ingredients_post_request_model.g.dart';

/// SearchRecipesByIngredientsPostRequestModel
///
/// Properties:
/// * [ingredients] 
/// * [limit] 
@BuiltValue()
abstract class SearchRecipesByIngredientsPostRequestModel implements Built<SearchRecipesByIngredientsPostRequestModel, SearchRecipesByIngredientsPostRequestModelBuilder> {
  @BuiltValueField(wireName: r'ingredients')
  BuiltList<String> get ingredients;

  @BuiltValueField(wireName: r'limit')
  int? get limit;

  SearchRecipesByIngredientsPostRequestModel._();

  factory SearchRecipesByIngredientsPostRequestModel([void updates(SearchRecipesByIngredientsPostRequestModelBuilder b)]) = _$SearchRecipesByIngredientsPostRequestModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchRecipesByIngredientsPostRequestModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchRecipesByIngredientsPostRequestModel> get serializer => _$SearchRecipesByIngredientsPostRequestModelSerializer();
}

class _$SearchRecipesByIngredientsPostRequestModelSerializer implements PrimitiveSerializer<SearchRecipesByIngredientsPostRequestModel> {
  @override
  final Iterable<Type> types = const [SearchRecipesByIngredientsPostRequestModel, _$SearchRecipesByIngredientsPostRequestModel];

  @override
  final String wireName = r'SearchRecipesByIngredientsPostRequestModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchRecipesByIngredientsPostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'ingredients';
    yield serializers.serialize(
      object.ingredients,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    if (object.limit != null) {
      yield r'limit';
      yield serializers.serialize(
        object.limit,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchRecipesByIngredientsPostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SearchRecipesByIngredientsPostRequestModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ingredients':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.ingredients.replace(valueDes);
          break;
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.limit = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SearchRecipesByIngredientsPostRequestModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchRecipesByIngredientsPostRequestModelBuilder();
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

