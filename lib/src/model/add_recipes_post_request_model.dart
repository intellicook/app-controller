//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/add_recipes_request_recipe_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_recipes_post_request_model.g.dart';

/// AddRecipesPostRequestModel
///
/// Properties:
/// * [recipes] 
@BuiltValue()
abstract class AddRecipesPostRequestModel implements Built<AddRecipesPostRequestModel, AddRecipesPostRequestModelBuilder> {
  @BuiltValueField(wireName: r'recipes')
  BuiltList<AddRecipesRequestRecipeModel> get recipes;

  AddRecipesPostRequestModel._();

  factory AddRecipesPostRequestModel([void updates(AddRecipesPostRequestModelBuilder b)]) = _$AddRecipesPostRequestModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddRecipesPostRequestModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddRecipesPostRequestModel> get serializer => _$AddRecipesPostRequestModelSerializer();
}

class _$AddRecipesPostRequestModelSerializer implements PrimitiveSerializer<AddRecipesPostRequestModel> {
  @override
  final Iterable<Type> types = const [AddRecipesPostRequestModel, _$AddRecipesPostRequestModel];

  @override
  final String wireName = r'AddRecipesPostRequestModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddRecipesPostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'recipes';
    yield serializers.serialize(
      object.recipes,
      specifiedType: const FullType(BuiltList, [FullType(AddRecipesRequestRecipeModel)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddRecipesPostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddRecipesPostRequestModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'recipes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AddRecipesRequestRecipeModel)]),
          ) as BuiltList<AddRecipesRequestRecipeModel>;
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
  AddRecipesPostRequestModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddRecipesPostRequestModelBuilder();
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

