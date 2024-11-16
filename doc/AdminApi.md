# app_controller_client.api.AdminApi

## Load the API package
```dart
import 'package:app_controller_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminUsersGet**](AdminApi.md#adminusersget) | **GET** /Admin/Users | Gets a list of all users.


# **adminUsersGet**
> BuiltList<UserGetResponseModel> adminUsersGet()

Gets a list of all users.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getAdminApi();

try {
    final response = api.adminUsersGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdminApi->adminUsersGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;UserGetResponseModel&gt;**](UserGetResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

