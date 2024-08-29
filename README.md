# app_controller_client (EXPERIMENTAL)
The controller service that connects backend components and the frontend.

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: v0.1
- Build package: org.openapitools.codegen.languages.DartDioClientCodegen

## Requirements

* Dart 2.15.0+ or Flutter 2.8.0+
* Dio 5.0.0+ (https://pub.dev/packages/dio)

## Installation & Usage

### pub.dev
To use the package from [pub.dev](https://pub.dev), please include the following in pubspec.yaml
```yaml
dependencies:
  app_controller_client: 1.0.0
```

### Github
If this Dart package is published to Github, please include the following in pubspec.yaml
```yaml
dependencies:
  app_controller_client:
    git:
      url: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
      #ref: main
```

### Local development
To use the package from your local drive, please include the following in pubspec.yaml
```yaml
dependencies:
  app_controller_client:
    path: /path/to/app_controller_client
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:app_controller_client/app_controller_client.dart';


final api = AppControllerClient().getHealthApi();

try {
    final response = await api.healthGet();
    print(response);
} catch on DioException (e) {
    print("Exception when calling HealthApi->healthGet: $e\n");
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
[*HealthApi*](doc/HealthApi.md) | [**healthGet**](doc/HealthApi.md#healthget) | **GET** /Health | Checks the health of App Controller and its components.
[*TemporaryApi*](doc/TemporaryApi.md) | [**apiTemporaryGet**](doc/TemporaryApi.md#apitemporaryget) | **GET** /Api/Temporary | Get method for temporary testing purposes.


## Documentation For Models

 - [HealthCheckModel](doc/HealthCheckModel.md)
 - [HealthGetResponseModel](doc/HealthGetResponseModel.md)
 - [HealthServiceModel](doc/HealthServiceModel.md)
 - [HealthStatusModel](doc/HealthStatusModel.md)


## Documentation For Authorization

Endpoints do not require authorization.


## Author



