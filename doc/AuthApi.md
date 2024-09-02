# app_controller_client.api.AuthApi

## Load the API package
```dart
import 'package:app_controller_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authLoginPost**](AuthApi.md#authloginpost) | **POST** /Auth/Login | Logs in a user.
[**authRegisterPost**](AuthApi.md#authregisterpost) | **POST** /Auth/Register | Registers a new user.


# **authLoginPost**
> LoginPostResponseModel authLoginPost(loginPostRequestModel)

Logs in a user.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getAuthApi();
final LoginPostRequestModel loginPostRequestModel = ; // LoginPostRequestModel | 

try {
    final response = api.authLoginPost(loginPostRequestModel);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authLoginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginPostRequestModel** | [**LoginPostRequestModel**](LoginPostRequestModel.md)|  | [optional] 

### Return type

[**LoginPostResponseModel**](LoginPostResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRegisterPost**
> authRegisterPost(registerPostRequestModel)

Registers a new user.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getAuthApi();
final RegisterPostRequestModel registerPostRequestModel = ; // RegisterPostRequestModel | 

try {
    api.authRegisterPost(registerPostRequestModel);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authRegisterPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerPostRequestModel** | [**RegisterPostRequestModel**](RegisterPostRequestModel.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

