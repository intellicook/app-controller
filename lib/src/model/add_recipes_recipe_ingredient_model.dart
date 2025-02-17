//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_recipes_recipe_ingredient_model.g.dart';

/// AddRecipesRecipeIngredientModel
///
/// Properties:
/// * [name] 
/// * [quantity] 
/// * [unit] 
@BuiltValue()
abstract class AddRecipesRecipeIngredientModel implements Built<AddRecipesRecipeIngredientModel, AddRecipesRecipeIngredientModelBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'quantity')
  double? get quantity;

  @BuiltValueField(wireName: r'unit')
  String? get unit;

  AddRecipesRecipeIngredientModel._();

  factory AddRecipesRecipeIngredientModel([void updates(AddRecipesRecipeIngredientModelBuilder b)]) = _$AddRecipesRecipeIngredientModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddRecipesRecipeIngredientModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddRecipesRecipeIngredientModel> get serializer => _$AddRecipesRecipeIngredientModelSerializer();
}

class _$AddRecipesRecipeIngredientModelSerializer implements PrimitiveSerializer<AddRecipesRecipeIngredientModel> {
  @override
  final Iterable<Type> types = const [AddRecipesRecipeIngredientModel, _$AddRecipesRecipeIngredientModel];

  @override
  final String wireName = r'AddRecipesRecipeIngredientModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddRecipesRecipeIngredientModel object, {
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
    AddRecipesRecipeIngredientModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddRecipesRecipeIngredientModelBuilder result,
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
  AddRecipesRecipeIngredientModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddRecipesRecipeIngredientModelBuilder();
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

