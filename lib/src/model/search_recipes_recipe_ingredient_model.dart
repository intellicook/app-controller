//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_recipe_ingredient_model.g.dart';

/// SearchRecipesRecipeIngredientModel
///
/// Properties:
/// * [name] 
/// * [quantity] 
/// * [unit] 
@BuiltValue()
abstract class SearchRecipesRecipeIngredientModel implements Built<SearchRecipesRecipeIngredientModel, SearchRecipesRecipeIngredientModelBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'quantity')
  double? get quantity;

  @BuiltValueField(wireName: r'unit')
  String? get unit;

  SearchRecipesRecipeIngredientModel._();

  factory SearchRecipesRecipeIngredientModel([void updates(SearchRecipesRecipeIngredientModelBuilder b)]) = _$SearchRecipesRecipeIngredientModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchRecipesRecipeIngredientModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchRecipesRecipeIngredientModel> get serializer => _$SearchRecipesRecipeIngredientModelSerializer();
}

class _$SearchRecipesRecipeIngredientModelSerializer implements PrimitiveSerializer<SearchRecipesRecipeIngredientModel> {
  @override
  final Iterable<Type> types = const [SearchRecipesRecipeIngredientModel, _$SearchRecipesRecipeIngredientModel];

  @override
  final String wireName = r'SearchRecipesRecipeIngredientModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchRecipesRecipeIngredientModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.quantity != null) {
      yield r'quantity';
      yield serializers.serialize(
        object.quantity,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.unit != null) {
      yield r'unit';
      yield serializers.serialize(
        object.unit,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchRecipesRecipeIngredientModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SearchRecipesRecipeIngredientModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.quantity = valueDes;
          break;
        case r'unit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.unit = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SearchRecipesRecipeIngredientModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchRecipesRecipeIngredientModelBuilder();
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

