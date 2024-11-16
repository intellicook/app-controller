//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:app_controller_client/src/model/validation_problem_details_model.dart';
import 'package:app_controller_client/src/model/problem_details_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'admin_users_get404_response.g.dart';

/// AdminUsersGet404Response
///
/// Properties:
/// * [type] 
/// * [title] 
/// * [status] 
/// * [detail] 
/// * [instance] 
/// * [traceId] 
/// * [errors] 
@BuiltValue()
abstract class AdminUsersGet404Response implements Built<AdminUsersGet404Response, AdminUsersGet404ResponseBuilder> {
  /// One Of [ProblemDetailsModel], [ValidationProblemDetailsModel]
  OneOf get oneOf;

  AdminUsersGet404Response._();

  factory AdminUsersGet404Response([void updates(AdminUsersGet404ResponseBuilder b)]) = _$AdminUsersGet404Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminUsersGet404ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminUsersGet404Response> get serializer => _$AdminUsersGet404ResponseSerializer();
}

class _$AdminUsersGet404ResponseSerializer implements PrimitiveSerializer<AdminUsersGet404Response> {
  @override
  final Iterable<Type> types = const [AdminUsersGet404Response, _$AdminUsersGet404Response];

  @override
  final String wireName = r'AdminUsersGet404Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminUsersGet404Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminUsersGet404Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value, specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  AdminUsersGet404Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminUsersGet404ResponseBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [FullType(ProblemDetailsModel), FullType(ValidationProblemDetailsModel), ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc, specifiedType: targetType) as OneOf;
    return result.build();
  }
}

