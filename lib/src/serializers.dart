//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:app_controller_client/src/date_serializer.dart';
import 'package:app_controller_client/src/model/date.dart';

import 'package:app_controller_client/src/model/health_check_model.dart';
import 'package:app_controller_client/src/model/health_get_response_model.dart';
import 'package:app_controller_client/src/model/health_service_model.dart';
import 'package:app_controller_client/src/model/health_status_model.dart';
import 'package:app_controller_client/src/model/login_post_request_model.dart';
import 'package:app_controller_client/src/model/login_post_response_model.dart';
import 'package:app_controller_client/src/model/problem_details.dart';
import 'package:app_controller_client/src/model/register_post_request_model.dart';
import 'package:app_controller_client/src/model/user_get_response_model.dart';
import 'package:app_controller_client/src/model/user_password_put_request_model.dart';
import 'package:app_controller_client/src/model/user_put_request_model.dart';
import 'package:app_controller_client/src/model/user_put_response_model.dart';
import 'package:app_controller_client/src/model/user_role_model.dart';
import 'package:app_controller_client/src/model/validation_problem_details.dart';

part 'serializers.g.dart';

@SerializersFor([
  HealthCheckModel,
  HealthGetResponseModel,
  HealthServiceModel,
  HealthStatusModel,
  LoginPostRequestModel,
  LoginPostResponseModel,
  ProblemDetails,
  RegisterPostRequestModel,
  UserGetResponseModel,
  UserPasswordPutRequestModel,
  UserPutRequestModel,
  UserPutResponseModel,
  UserRoleModel,
  ValidationProblemDetails,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(HealthGetResponseModel)]),
        () => ListBuilder<HealthGetResponseModel>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
