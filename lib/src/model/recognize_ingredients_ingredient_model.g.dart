// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recognize_ingredients_ingredient_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecognizeIngredientsIngredientModel
    extends RecognizeIngredientsIngredientModel {
  @override
  final String name;
  @override
  final double x;
  @override
  final double y;
  @override
  final double width;
  @override
  final double height;

  factory _$RecognizeIngredientsIngredientModel(
          [void Function(RecognizeIngredientsIngredientModelBuilder)?
              updates]) =>
      (new RecognizeIngredientsIngredientModelBuilder()..update(updates))
          ._build();

  _$RecognizeIngredientsIngredientModel._(
      {required this.name,
      required this.x,
      required this.y,
      required this.width,
      required this.height})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'RecognizeIngredientsIngredientModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        x, r'RecognizeIngredientsIngredientModel', 'x');
    BuiltValueNullFieldError.checkNotNull(
        y, r'RecognizeIngredientsIngredientModel', 'y');
    BuiltValueNullFieldError.checkNotNull(
        width, r'RecognizeIngredientsIngredientModel', 'width');
    BuiltValueNullFieldError.checkNotNull(
        height, r'RecognizeIngredientsIngredientModel', 'height');
  }

  @override
  RecognizeIngredientsIngredientModel rebuild(
          void Function(RecognizeIngredientsIngredientModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecognizeIngredientsIngredientModelBuilder toBuilder() =>
      new RecognizeIngredientsIngredientModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecognizeIngredientsIngredientModel &&
        name == other.name &&
        x == other.x &&
        y == other.y &&
        width == other.width &&
        height == other.height;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, width.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecognizeIngredientsIngredientModel')
          ..add('name', name)
          ..add('x', x)
          ..add('y', y)
          ..add('width', width)
          ..add('height', height))
        .toString();
  }
}

class RecognizeIngredientsIngredientModelBuilder
    implements
        Builder<RecognizeIngredientsIngredientModel,
            RecognizeIngredientsIngredientModelBuilder> {
  _$RecognizeIngredientsIngredientModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _x;
  double? get x => _$this._x;
  set x(double? x) => _$this._x = x;

  double? _y;
  double? get y => _$this._y;
  set y(double? y) => _$this._y = y;

  double? _width;
  double? get width => _$this._width;
  set width(double? width) => _$this._width = width;

  double? _height;
  double? get height => _$this._height;
  set height(double? height) => _$this._height = height;

  RecognizeIngredientsIngredientModelBuilder() {
    RecognizeIngredientsIngredientModel._defaults(this);
  }

  RecognizeIngredientsIngredientModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _x = $v.x;
      _y = $v.y;
      _width = $v.width;
      _height = $v.height;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecognizeIngredientsIngredientModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecognizeIngredientsIngredientModel;
  }

  @override
  void update(
      void Function(RecognizeIngredientsIngredientModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecognizeIngredientsIngredientModel build() => _build();

  _$RecognizeIngredientsIngredientModel _build() {
    final _$result = _$v ??
        new _$RecognizeIngredientsIngredientModel._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'RecognizeIngredientsIngredientModel', 'name'),
            x: BuiltValueNullFieldError.checkNotNull(
                x, r'RecognizeIngredientsIngredientModel', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(
                y, r'RecognizeIngredientsIngredientModel', 'y'),
            width: BuiltValueNullFieldError.checkNotNull(
                width, r'RecognizeIngredientsIngredientModel', 'width'),
            height: BuiltValueNullFieldError.checkNotNull(
                height, r'RecognizeIngredientsIngredientModel', 'height'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
