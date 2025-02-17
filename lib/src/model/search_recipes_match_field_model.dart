//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_recipes_match_field_model.g.dart';

class SearchRecipesMatchFieldModel extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Title')
  static const SearchRecipesMatchFieldModel title = _$title;
  @BuiltValueEnumConst(wireName: r'Description')
  static const SearchRecipesMatchFieldModel description = _$description;
  @BuiltValueEnumConst(wireName: r'Ingredients')
  static const SearchRecipesMatchFieldModel ingredients = _$ingredients;

  static Serializer<SearchRecipesMatchFieldModel> get serializer => _$searchRecipesMatchFieldModelSerializer;

  const SearchRecipesMatchFieldModel._(String name): super(name);

  static BuiltSet<SearchRecipesMatchFieldModel> get values => _$values;
  static SearchRecipesMatchFieldModel valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SearchRecipesMatchFieldModelMixin = Object with _$SearchRecipesMatchFieldModelMixin;

