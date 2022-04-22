import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group(
    'FEATURE: Application workflow',
    () {
      late FlutterDriver driver;

      setUpAll(
        () async {
          driver = await FlutterDriver.connect(
            timeout: const Duration(seconds: 5),
            dartVmServiceUrl:
                'ws://127.0.0.1:59483/lDtVsbG1tuI=/ws', //<-- Paste it here
          );
        },
      );

      tearDownAll(
        () async {
          driver.close();
        },
      );

      final button = find.byType('SaveButton');
      final input = find.byType('TextFieldInput');

      test(
        "GIVEN TextFieldInput with a value '' THEN SaveButton is disabled AND do nothing if pressed",
        () async {
          await driver.tap(input);
          await driver.enterText('');
          await driver.tap(button);
        },
      );

      test(
        "GIVEN TextFieldInput with a not valid URL 'google.com' THEN SaveButton is disabled AND do nothing if pressed",
        () async {
          await driver.tap(input);
          await driver.enterText('google.com');
          await driver.tap(button);
        },
      );

      test(
        "GIVEN the Recently shortened URLs empty AND TextFieldInput with a value 'https://github.com/Leoocast' THEN a new card has to appear",
        () async {
          await driver.tap(input);
          await driver.enterText('');
          await driver.enterText('https://github.com/Leoocast');
          await driver.tap(button);

          final card = find.byValueKey('card_0');

          final test = await driver.getWidgetDiagnostics(card);
          expect(test["description"], "Card-[<'card_0'>]");
        },
      );
    },
  );
}
