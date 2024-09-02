# app_controller_client.api.TemporaryApi

## Load the API package
```dart
import 'package:app_controller_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiTemporaryGet**](TemporaryApi.md#apitemporaryget) | **GET** /Api/Temporary | Get method for temporary testing purposes.


# **apiTemporaryGet**
> apiTemporaryGet()

Get method for temporary testing purposes.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getTemporaryApi();

try {
    api.apiTemporaryGet();
} catch on DioException (e) {
    print('Exception when calling TemporaryApi->apiTemporaryGet: $e\n');
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
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

