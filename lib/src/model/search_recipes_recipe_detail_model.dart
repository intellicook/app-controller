//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_recipe_detail_model.g.dart';

/// SearchRecipesRecipeDetailModel
///
/// Properties:
/// * [instructions] 
/// * [raw] 
@BuiltValue()
abstract class SearchRecipesRecipeDetailModel implements Built<SearchRecipesRecipeDetailModel, SearchRecipesRecipeDetailModelBuilder> {
  @BuiltValueField(wireName: r'instructions')
  BuiltList<String> get instructions;

  @BuiltValueField(wireName: r'raw')
  String get raw;

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

