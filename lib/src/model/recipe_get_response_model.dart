//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recipe_get_response_model.g.dart';

/// RecipeGetResponseModel
///
/// Properties:
/// * [name] 
/// * [ingredients] 
/// * [instructions] 
@BuiltValue()
abstract class RecipeGetResponseModel implements Built<RecipeGetResponseModel, RecipeGetResponseModelBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'ingredients')
  BuiltList<String> get ingredients;

  @BuiltValueField(wireName: r'instructions')
  BuiltList<String> get instructions;

  RecipeGetResponseModel._();

  factory RecipeGetResponseModel([void updates(RecipeGetResponseModelBuilder b)]) = _$RecipeGetResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecipeGetResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecipeGetResponseModel> get serializer => _$RecipeGetResponseModelSerializer();
}

class _$RecipeGetResponseModelSerializer implements PrimitiveSerializer<RecipeGetResponseModel> {
  @override
  final Iterable<Type> types = const [RecipeGetResponseModel, _$RecipeGetResponseModel];

  @override
  final String wireName = r'RecipeGetResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecipeGetResponseModel object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    RecipeGetResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RecipeGetResponseModelBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RecipeGetResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecipeGetResponseModelBuilder();
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

