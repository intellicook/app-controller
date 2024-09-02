import 'package:test/test.dart';
import 'package:app_controller_client/app_controller_client.dart';


/// tests for UserApi
void main() {
  final instance = AppControllerClient().getUserApi();

  group(UserApi, () {
    // Deletes the current user.
    //
    //Future userMeDelete() async
    test('test userMeDelete', () async {
      // TODO
    });

    // Gets the current user.
    //
    //Future<UserGetResponseModel> userMeGet() async
    test('test userMeGet', () async {
      // TODO
    });

    // Updates the current user's password.
    //
    //Future userMePasswordPut({ UserPasswordPutRequestModel userPasswordPutRequestModel }) async
    test('test userMePasswordPut', () async {
      // TODO
    });

    // Updates the current user.
    //
    //Future userMePut({ UserPutRequestModel userPutRequestModel }) async
    test('test userMePut', () async {
      // TODO
    });

  });
}
