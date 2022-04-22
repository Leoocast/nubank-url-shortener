import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_url_shortener/main.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/send_button.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/text_field.dart';

void main() {
  group('FEATURE: SaveButton has to be disabled when url is not valid', () {
    final buttonFinder = find.byType(SaveButton);
    final cardFinder = find.byKey(const Key('card_0'));
    final inputFinder = find.byType(TextFieldInput);

    testWidgets(
      "GIVEN the TextFieldInput with a not valid url THEN SaveButton is disabled",
      (WidgetTester tester) async {
        // ARRANGE
        await tester.pumpWidget(
          const App(),
        );

        // ACT
        await tester.tap(buttonFinder);
        await tester.pump();

        // ASSERT
        expect(cardFinder, findsNothing);

        // ARRANGE
        await tester.enterText(inputFinder, 'github.com');

        // ACT
        await tester.tap(buttonFinder);
        await tester.pump();

        // ASSERT
        expect(cardFinder, findsNothing);
      },
    );
  });
}
