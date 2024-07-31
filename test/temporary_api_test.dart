import 'package:test/test.dart';
import 'package:app_controller_client/app_controller_client.dart';


/// tests for TemporaryApi
void main() {
  final instance = AppControllerClient().getTemporaryApi();

  group(TemporaryApi, () {
    // Get method for temporary testing purposes.
    //
    //Future apiTemporaryGet() async
    test('test apiTemporaryGet', () async {
      // TODO
    });

  });
}
