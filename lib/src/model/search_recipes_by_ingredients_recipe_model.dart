//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/search_recipes_by_ingredients_recipe_detail_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_by_ingredients_recipe_model.g.dart';

/// SearchRecipesByIngredientsRecipeModel
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [detail] 
@BuiltValue()
abstract class SearchRecipesByIngredientsRecipeModel implements Built<SearchRecipesByIngredientsRecipeModel, SearchRecipesByIngredientsRecipeModelBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'detail')
  SearchRecipesByIngredientsRecipeDetailModel? get detail;

  SearchRecipesByIngredientsRecipeModel._();

  factory SearchRecipesByIngredientsRecipeModel([void updates(SearchRecipesByIngredientsRecipeModelBuilder b)]) = _$SearchRecipesByIngredientsRecipeModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchRecipesByIngredientsRecipeModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchRecipesByIngredientsRecipeModel> get serializer => _$SearchRecipesByIngredientsRecipeModelSerializer();
}

class _$SearchRecipesByIngredientsRecipeModelSerializer implements PrimitiveSerializer<SearchRecipesByIngredientsRecipeModel> {
  @override
  final Iterable<Type> types = const [SearchRecipesByIngredientsRecipeModel, _$SearchRecipesByIngredientsRecipeModel];

  @override
  final String wireName = r'SearchRecipesByIngredientsRecipeModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchRecipesByIngredientsRecipeModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.detail != null) {
      yield r'detail';
      yield serializers.serialize(
        object.detail,
        specifiedType: const FullType(SearchRecipesByIngredientsRecipeDetailModel),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchRecipesByIngredientsRecipeModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SearchRecipesByIngredientsRecipeModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'detail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SearchRecipesByIngredientsRecipeDetailModel),
          ) as SearchRecipesByIngredientsRecipeDetailModel;
          result.detail.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SearchRecipesByIngredientsRecipeModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchRecipesByIngredientsRecipeModelBuilder();
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

