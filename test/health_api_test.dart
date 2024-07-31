import 'package:test/test.dart';
import 'package:app_controller_client/app_controller_client.dart';


/// tests for HealthApi
void main() {
  final instance = AppControllerClient().getHealthApi();

  group(HealthApi, () {
    // Checks the health of App Controller and its components.
    //
    //Future<HealthGetResponseModel> healthGet() async
    test('test healthGet', () async {
      // TODO
    });

  });
}
