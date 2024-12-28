//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:app_controller_client/src/model/search_recipes_match_field_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_match_model.g.dart';

/// SearchRecipesMatchModel
///
/// Properties:
/// * [field] 
/// * [tokens] 
/// * [index] 
@BuiltValue()
abstract class SearchRecipesMatchModel implements Built<SearchRecipesMatchModel, SearchRecipesMatchModelBuilder> {
  @BuiltValueField(wireName: r'field')
  SearchRecipesMatchFieldModel get field;
  // enum fieldEnum {  Name,  Ingredients,  };

  @BuiltValueField(wireName: r'tokens')
  BuiltList<String> get tokens;

  @BuiltValueField(wireName: r'index')
  int? get index;

  SearchRecipesMatchModel._();

  factory SearchRecipesMatchModel([void updates(SearchRecipesMatchModelBuilder b)]) = _$SearchRecipesMatchModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchRecipesMatchModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchRecipesMatchModel> get serializer => _$SearchRecipesMatchModelSerializer();
}

class _$SearchRecipesMatchModelSerializer implements PrimitiveSerializer<SearchRecipesMatchModel> {
  @override
  final Iterable<Type> types = const [SearchRecipesMatchModel, _$SearchRecipesMatchModel];

  @override
  final String wireName = r'SearchRecipesMatchModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchRecipesMatchModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'field';
    yield serializers.serialize(
      object.field,
      specifiedType: const FullType(SearchRecipesMatchFieldModel),
    );
    yield r'tokens';
    yield serializers.serialize(
      object.tokens,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    if (object.index != null) {
      yield r'index';
      yield serializers.serialize(
        object.index,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchRecipesMatchModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SearchRecipesMatchModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'field':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SearchRecipesMatchFieldModel),
          ) as SearchRecipesMatchFieldModel;
          result.field = valueDes;
          break;
        case r'tokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.tokens.replace(valueDes);
          break;
        case r'index':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.index = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SearchRecipesMatchModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchRecipesMatchModelBuilder();
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

