//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recognize_ingredients_ingredient_model.g.dart';

/// RecognizeIngredientsIngredientModel
///
/// Properties:
/// * [name] 
/// * [x] 
/// * [y] 
/// * [width] 
/// * [height] 
@BuiltValue()
abstract class RecognizeIngredientsIngredientModel implements Built<RecognizeIngredientsIngredientModel, RecognizeIngredientsIngredientModelBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'x')
  double get x;

  @BuiltValueField(wireName: r'y')
  double get y;

  @BuiltValueField(wireName: r'width')
  double get width;

  @BuiltValueField(wireName: r'height')
  double get height;

  RecognizeIngredientsIngredientModel._();

  factory RecognizeIngredientsIngredientModel([void updates(RecognizeIngredientsIngredientModelBuilder b)]) = _$RecognizeIngredientsIngredientModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecognizeIngredientsIngredientModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecognizeIngredientsIngredientModel> get serializer => _$RecognizeIngredientsIngredientModelSerializer();
}

class _$RecognizeIngredientsIngredientModelSerializer implements PrimitiveSerializer<RecognizeIngredientsIngredientModel> {
  @override
  final Iterable<Type> types = const [RecognizeIngredientsIngredientModel, _$RecognizeIngredientsIngredientModel];

  @override
  final String wireName = r'RecognizeIngredientsIngredientModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecognizeIngredientsIngredientModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'x';
    yield serializers.serialize(
      object.x,
      specifiedType: const FullType(double),
    );
    yield r'y';
    yield serializers.serialize(
      object.y,
      specifiedType: const FullType(double),
    );
    yield r'width';
    yield serializers.serialize(
      object.width,
      specifiedType: const FullType(double),
    );
    yield r'height';
    yield serializers.serialize(
      object.height,
      specifiedType: const FullType(double),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RecognizeIngredientsIngredientModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RecognizeIngredientsIngredientModelBuilder result,
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
        case r'x':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.x = valueDes;
          break;
        case r'y':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.y = valueDes;
          break;
        case r'width':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.width = valueDes;
          break;
        case r'height':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.height = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RecognizeIngredientsIngredientModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecognizeIngredientsIngredientModelBuilder();
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

