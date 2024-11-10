//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_by_ingredients_recipe_detail_model.g.dart';

/// SearchRecipesByIngredientsRecipeDetailModel
///
/// Properties:
/// * [ingredients] 
/// * [instructions] 
/// * [raw] 
@BuiltValue()
abstract class SearchRecipesByIngredientsRecipeDetailModel implements Built<SearchRecipesByIngredientsRecipeDetailModel, SearchRecipesByIngredientsRecipeDetailModelBuilder> {
  @BuiltValueField(wireName: r'ingredients')
  BuiltList<String> get ingredients;

  @BuiltValueField(wireName: r'instructions')
  BuiltList<String> get instructions;

  @BuiltValueField(wireName: r'raw')
  String get raw;

  SearchRecipesByIngredientsRecipeDetailModel._();

  factory SearchRecipesByIngredientsRecipeDetailModel([void updates(SearchRecipesByIngredientsRecipeDetailModelBuilder b)]) = _$SearchRecipesByIngredientsRecipeDetailModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchRecipesByIngredientsRecipeDetailModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchRecipesByIngredientsRecipeDetailModel> get serializer => _$SearchRecipesByIngredientsRecipeDetailModelSerializer();
}

class _$SearchRecipesByIngredientsRecipeDetailModelSerializer implements PrimitiveSerializer<SearchRecipesByIngredientsRecipeDetailModel> {
  @override
  final Iterable<Type> types = const [SearchRecipesByIngredientsRecipeDetailModel, _$SearchRecipesByIngredientsRecipeDetailModel];

  @override
  final String wireName = r'SearchRecipesByIngredientsRecipeDetailModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchRecipesByIngredientsRecipeDetailModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'ingredients';
    yield serializers.serialize(
      object.ingredients,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'instructions';
    yield serializers.serialize(
      object.instructions,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'raw';
    yield serializers.serialize(
      object.raw,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchRecipesByIngredientsRecipeDetailModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SearchRecipesByIngredientsRecipeDetailModelBuilder result,
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
        case r'instructions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.instructions.replace(valueDes);
          break;
        case r'raw':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.raw = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SearchRecipesByIngredientsRecipeDetailModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchRecipesByIngredientsRecipeDetailModelBuilder();
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

