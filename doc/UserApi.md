# app_controller_client.api.UserApi

## Load the API package
```dart
import 'package:app_controller_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userMeDelete**](UserApi.md#usermedelete) | **DELETE** /User/Me | Deletes the current user.
[**userMeGet**](UserApi.md#usermeget) | **GET** /User/Me | Gets the current user.
[**userMePasswordPut**](UserApi.md#usermepasswordput) | **PUT** /User/Me/Password | Updates the current user&#39;s password.
[**userMePut**](UserApi.md#usermeput) | **PUT** /User/Me | Updates the current user.


# **userMeDelete**
> userMeDelete()

Deletes the current user.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getUserApi();

try {
    api.userMeDelete();
} catch on DioException (e) {
    print('Exception when calling UserApi->userMeDelete: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userMeGet**
> UserGetResponseModel userMeGet()

Gets the current user.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getUserApi();

try {
    final response = api.userMeGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserApi->userMeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserGetResponseModel**](UserGetResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userMePasswordPut**
> userMePasswordPut(userPasswordPutRequestModel)

Updates the current user's password.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getUserApi();
final UserPasswordPutRequestModel userPasswordPutRequestModel = ; // UserPasswordPutRequestModel | 

try {
    api.userMePasswordPut(userPasswordPutRequestModel);
} catch on DioException (e) {
    print('Exception when calling UserApi->userMePasswordPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userPasswordPutRequestModel** | [**UserPasswordPutRequestModel**](UserPasswordPutRequestModel.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userMePut**
> userMePut(userPutRequestModel)

Updates the current user.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getUserApi();
final UserPutRequestModel userPutRequestModel = ; // UserPutRequestModel | 

try {
    api.userMePut(userPutRequestModel);
} catch on DioException (e) {
    print('Exception when calling UserApi->userMePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userPutRequestModel** | [**UserPutRequestModel**](UserPutRequestModel.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

