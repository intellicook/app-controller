//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/add_recipes_response_recipe_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_recipes_post_response_model.g.dart';

/// AddRecipesPostResponseModel
///
/// Properties:
/// * [recipes] 
@BuiltValue()
abstract class AddRecipesPostResponseModel implements Built<AddRecipesPostResponseModel, AddRecipesPostResponseModelBuilder> {
  @BuiltValueField(wireName: r'recipes')
  BuiltList<AddRecipesResponseRecipeModel> get recipes;

  AddRecipesPostResponseModel._();

  factory AddRecipesPostResponseModel([void updates(AddRecipesPostResponseModelBuilder b)]) = _$AddRecipesPostResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddRecipesPostResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddRecipesPostResponseModel> get serializer => _$AddRecipesPostResponseModelSerializer();
}

class _$AddRecipesPostResponseModelSerializer implements PrimitiveSerializer<AddRecipesPostResponseModel> {
  @override
  final Iterable<Type> types = const [AddRecipesPostResponseModel, _$AddRecipesPostResponseModel];

  @override
  final String wireName = r'AddRecipesPostResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddRecipesPostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'recipes';
    yield serializers.serialize(
      object.recipes,
      specifiedType: const FullType(BuiltList, [FullType(AddRecipesResponseRecipeModel)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddRecipesPostResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddRecipesPostResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'recipes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AddRecipesResponseRecipeModel)]),
          ) as BuiltList<AddRecipesResponseRecipeModel>;
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
  AddRecipesPostResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddRecipesPostResponseModelBuilder();
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

