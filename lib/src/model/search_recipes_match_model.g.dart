// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_match_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchRecipesMatchModel extends SearchRecipesMatchModel {
  @override
  final SearchRecipesMatchFieldModel field;
  @override
  final BuiltList<String> tokens;
  @override
  final int? index;

  factory _$SearchRecipesMatchModel(
          [void Function(SearchRecipesMatchModelBuilder)? updates]) =>
      (new SearchRecipesMatchModelBuilder()..update(updates))._build();

  _$SearchRecipesMatchModel._(
      {required this.field, required this.tokens, this.index})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        field, r'SearchRecipesMatchModel', 'field');
    BuiltValueNullFieldError.checkNotNull(
        tokens, r'SearchRecipesMatchModel', 'tokens');
  }

  @override
  SearchRecipesMatchModel rebuild(
          void Function(SearchRecipesMatchModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRecipesMatchModelBuilder toBuilder() =>
      new SearchRecipesMatchModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRecipesMatchModel &&
        field == other.field &&
        tokens == other.tokens &&
        index == other.index;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, field.hashCode);
    _$hash = $jc(_$hash, tokens.hashCode);
    _$hash = $jc(_$hash, index.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchRecipesMatchModel')
          ..add('field', field)
          ..add('tokens', tokens)
          ..add('index', index))
        .toString();
  }
}

class SearchRecipesMatchModelBuilder
    implements
        Builder<SearchRecipesMatchModel, SearchRecipesMatchModelBuilder> {
  _$SearchRecipesMatchModel? _$v;

  SearchRecipesMatchFieldModel? _field;
  SearchRecipesMatchFieldModel? get field => _$this._field;
  set field(SearchRecipesMatchFieldModel? field) => _$this._field = field;

  ListBuilder<String>? _tokens;
  ListBuilder<String> get tokens =>
      _$this._tokens ??= new ListBuilder<String>();
  set tokens(ListBuilder<String>? tokens) => _$this._tokens = tokens;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  SearchRecipesMatchModelBuilder() {
    SearchRecipesMatchModel._defaults(this);
  }

  SearchRecipesMatchModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _field = $v.field;
      _tokens = $v.tokens.toBuilder();
      _index = $v.index;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchRecipesMatchModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRecipesMatchModel;
  }

  @override
  void update(void Function(SearchRecipesMatchModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRecipesMatchModel build() => _build();

  _$SearchRecipesMatchModel _build() {
    _$SearchRecipesMatchModel _$result;
    try {
      _$result = _$v ??
          new _$SearchRecipesMatchModel._(
            field: BuiltValueNullFieldError.checkNotNull(
                field, r'SearchRecipesMatchModel', 'field'),
            tokens: tokens.build(),
            index: index,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tokens';
        tokens.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchRecipesMatchModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
