//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_recipes_request_recipe_model.g.dart';

/// AddRecipesRequestRecipeModel
///
/// Properties:
/// * [name] 
/// * [ingredients] 
/// * [instructions] 
/// * [raw] 
@BuiltValue()
abstract class AddRecipesRequestRecipeModel implements Built<AddRecipesRequestRecipeModel, AddRecipesRequestRecipeModelBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'ingredients')
  BuiltList<String> get ingredients;

  @BuiltValueField(wireName: r'instructions')
  BuiltList<String> get instructions;

  @BuiltValueField(wireName: r'raw')
  String? get raw;

  AddRecipesRequestRecipeModel._();

  factory AddRecipesRequestRecipeModel([void updates(AddRecipesRequestRecipeModelBuilder b)]) = _$AddRecipesRequestRecipeModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddRecipesRequestRecipeModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddRecipesRequestRecipeModel> get serializer => _$AddRecipesRequestRecipeModelSerializer();
}

class _$AddRecipesRequestRecipeModelSerializer implements PrimitiveSerializer<AddRecipesRequestRecipeModel> {
  @override
  final Iterable<Type> types = const [AddRecipesRequestRecipeModel, _$AddRecipesRequestRecipeModel];

  @override
  final String wireName = r'AddRecipesRequestRecipeModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddRecipesRequestRecipeModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
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
    if (object.raw != null) {
      yield r'raw';
      yield serializers.serialize(
        object.raw,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AddRecipesRequestRecipeModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddRecipesRequestRecipeModelBuilder result,
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
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
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
  AddRecipesRequestRecipeModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddRecipesRequestRecipeModelBuilder();
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

