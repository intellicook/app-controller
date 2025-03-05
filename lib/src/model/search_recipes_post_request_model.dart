//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_post_request_model.g.dart';

/// SearchRecipesPostRequestModel
///
/// Properties:
/// * [ingredients] 
/// * [extraTerms] 
/// * [page] 
/// * [perPage] 
/// * [includeDetail] 
@BuiltValue()
abstract class SearchRecipesPostRequestModel implements Built<SearchRecipesPostRequestModel, SearchRecipesPostRequestModelBuilder> {
  @BuiltValueField(wireName: r'ingredients')
  BuiltList<String> get ingredients;

  @BuiltValueField(wireName: r'extraTerms')
  String? get extraTerms;

  @BuiltValueField(wireName: r'page')
  int? get page;

  @BuiltValueField(wireName: r'perPage')
  int? get perPage;

  @BuiltValueField(wireName: r'includeDetail')
  bool? get includeDetail;

  SearchRecipesPostRequestModel._();

  factory SearchRecipesPostRequestModel([void updates(SearchRecipesPostRequestModelBuilder b)]) = _$SearchRecipesPostRequestModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchRecipesPostRequestModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchRecipesPostRequestModel> get serializer => _$SearchRecipesPostRequestModelSerializer();
}

class _$SearchRecipesPostRequestModelSerializer implements PrimitiveSerializer<SearchRecipesPostRequestModel> {
  @override
  final Iterable<Type> types = const [SearchRecipesPostRequestModel, _$SearchRecipesPostRequestModel];

  @override
  final String wireName = r'SearchRecipesPostRequestModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchRecipesPostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'ingredients';
    yield serializers.serialize(
      object.ingredients,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    if (object.extraTerms != null) {
      yield r'extraTerms';
      yield serializers.serialize(
        object.extraTerms,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.page != null) {
      yield r'page';
      yield serializers.serialize(
        object.page,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.perPage != null) {
      yield r'perPage';
      yield serializers.serialize(
        object.perPage,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.includeDetail != null) {
      yield r'includeDetail';
      yield serializers.serialize(
        object.includeDetail,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchRecipesPostRequestModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SearchRecipesPostRequestModelBuilder result,
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
        case r'extraTerms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.extraTerms = valueDes;
          break;
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.page = valueDes;
          break;
        case r'perPage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.perPage = valueDes;
          break;
        case r'includeDetail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.includeDetail = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SearchRecipesPostRequestModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchRecipesPostRequestModelBuilder();
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

