import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group(
    'FEATURE: Application workflow',
    () {
      late FlutterDriver driver;

      // When you run the app, need to copy and paste the url of VM Service:
      setUpAll(
        () async {
          driver = await FlutterDriver.connect(
              timeout: const Duration(seconds: 5),
              dartVmServiceUrl: 'ws://127.0.0.1:51209/sPv2ke-v0o4=/ws');
        },
      );

      final button = find.byType('SaveButton');
      final input = find.byType('TextFieldInput');

      test(
        "GIVEN the TextFieldInput with a value '' THEN SaveButton is disabled AND do nothing if pressed",
        () async {
          await driver.tap(input);
          await driver.tap(button);

          final card = find.byType('UrlCard');
        },
      );
    },
  );
}
