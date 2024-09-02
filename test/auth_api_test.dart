import 'package:test/test.dart';
import 'package:app_controller_client/app_controller_client.dart';


/// tests for AuthApi
void main() {
  final instance = AppControllerClient().getAuthApi();

  group(AuthApi, () {
    // Logs in a user.
    //
    //Future<LoginPostResponseModel> authLoginPost({ LoginPostRequestModel loginPostRequestModel }) async
    test('test authLoginPost', () async {
      // TODO
    });

    // Registers a new user.
    //
    //Future authRegisterPost({ RegisterPostRequestModel registerPostRequestModel }) async
    test('test authRegisterPost', () async {
      // TODO
    });

  });
}
