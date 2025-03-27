# app_controller_client.api.IngredientRecognitionApi

## Load the API package
```dart
import 'package:app_controller_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ingredientRecognitionRecognizeIngredientsPost**](IngredientRecognitionApi.md#ingredientrecognitionrecognizeingredientspost) | **POST** /IngredientRecognition/RecognizeIngredients | Recognize ingredients from image.
[**ingredientRecognitionSelectIngredientPost**](IngredientRecognitionApi.md#ingredientrecognitionselectingredientpost) | **POST** /IngredientRecognition/SelectIngredient | Select ingredient from image.


# **ingredientRecognitionRecognizeIngredientsPost**
> RecognizeIngredientsPostResponseModel ingredientRecognitionRecognizeIngredientsPost(image)

Recognize ingredients from image.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getIngredientRecognitionApi();
final MultipartFile image = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.ingredientRecognitionRecognizeIngredientsPost(image);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IngredientRecognitionApi->ingredientRecognitionRecognizeIngredientsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **image** | **MultipartFile**|  | 

### Return type

[**RecognizeIngredientsPostResponseModel**](RecognizeIngredientsPostResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ingredientRecognitionSelectIngredientPost**
> Uint8List ingredientRecognitionSelectIngredientPost(image, X, Y)

Select ingredient from image.

### Example
```dart
import 'package:app_controller_client/api.dart';

final api = AppControllerClient().getIngredientRecognitionApi();
final MultipartFile image = BINARY_DATA_HERE; // MultipartFile | 
final int X = 56; // int | 
final int Y = 56; // int | 

try {
    final response = api.ingredientRecognitionSelectIngredientPost(image, X, Y);
    print(response);
} catch on DioException (e) {
    print('Exception when calling IngredientRecognitionApi->ingredientRecognitionSelectIngredientPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **image** | **MultipartFile**|  | 
 **X** | **int**|  | 
 **Y** | **int**|  | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

