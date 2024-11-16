import 'package:test/test.dart';
import 'package:app_controller_client/app_controller_client.dart';


/// tests for AdminApi
void main() {
  final instance = AppControllerClient().getAdminApi();

  group(AdminApi, () {
    // Gets a list of all users.
    //
    //Future<BuiltList<UserGetResponseModel>> adminUsersGet() async
    test('test adminUsersGet', () async {
      // TODO
    });

  });
}
