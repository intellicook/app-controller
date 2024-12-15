import 'package:test/test.dart';
import 'package:app_controller_client/app_controller_client.dart';


/// tests for IngredientRecognitionApi
void main() {
  final instance = AppControllerClient().getIngredientRecognitionApi();

  group(IngredientRecognitionApi, () {
    // Recognize ingredients from image.
    //
    //Future<RecognizeIngredientsPostResponseModel> ingredientRecognitionRecognizeIngredientsPost(MultipartFile image) async
    test('test ingredientRecognitionRecognizeIngredientsPost', () async {
      // TODO
    });

  });
}
