// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_match_field_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SearchRecipesMatchFieldModel _$title =
    const SearchRecipesMatchFieldModel._('title');
const SearchRecipesMatchFieldModel _$description =
    const SearchRecipesMatchFieldModel._('description');
const SearchRecipesMatchFieldModel _$ingredients =
    const SearchRecipesMatchFieldModel._('ingredients');

SearchRecipesMatchFieldModel _$valueOf(String name) {
  switch (name) {
    case 'title':
      return _$title;
    case 'description':
      return _$description;
    case 'ingredients':
      return _$ingredients;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SearchRecipesMatchFieldModel> _$values = new BuiltSet<
    SearchRecipesMatchFieldModel>(const <SearchRecipesMatchFieldModel>[
  _$title,
  _$description,
  _$ingredients,
]);

class _$SearchRecipesMatchFieldModelMeta {
  const _$SearchRecipesMatchFieldModelMeta();
  SearchRecipesMatchFieldModel get title => _$title;
  SearchRecipesMatchFieldModel get description => _$description;
  SearchRecipesMatchFieldModel get ingredients => _$ingredients;
  SearchRecipesMatchFieldModel valueOf(String name) => _$valueOf(name);
  BuiltSet<SearchRecipesMatchFieldModel> get values => _$values;
}

abstract class _$SearchRecipesMatchFieldModelMixin {
  // ignore: non_constant_identifier_names
  _$SearchRecipesMatchFieldModelMeta get SearchRecipesMatchFieldModel =>
      const _$SearchRecipesMatchFieldModelMeta();
}

Serializer<SearchRecipesMatchFieldModel>
    _$searchRecipesMatchFieldModelSerializer =
    new _$SearchRecipesMatchFieldModelSerializer();

class _$SearchRecipesMatchFieldModelSerializer
    implements PrimitiveSerializer<SearchRecipesMatchFieldModel> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'title': 'Title',
    'description': 'Description',
    'ingredients': 'Ingredients',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Title': 'title',
    'Description': 'description',
    'Ingredients': 'ingredients',
  };

  @override
  final Iterable<Type> types = const <Type>[SearchRecipesMatchFieldModel];
  @override
  final String wireName = 'SearchRecipesMatchFieldModel';

  @override
  Object serialize(Serializers serializers, SearchRecipesMatchFieldModel object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SearchRecipesMatchFieldModel deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SearchRecipesMatchFieldModel.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
