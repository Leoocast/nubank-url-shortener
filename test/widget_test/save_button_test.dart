import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_url_shortener/main.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/send_button.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/text_field.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/url_card.dart';

void main() {
  group('FEATURE: SaveButton has to be disabled when url is not valid', () {
    testWidgets(
      "GIVEN the TextFieldInput with a not valid url THEN SaveButton is disabled",
      (WidgetTester tester) async {
        // ASSEMBLE
        await tester.pumpWidget(
          const App(),
        );

        final button = find.byType(SaveButton);

        // ACT
        await tester.tap(button);
        await tester.pump();

        // ASSERT
        var card = find.byType(UrlCard);
        expect(card, findsNothing);

        // ASSEMBLE
        await tester.enterText(
          find.byType(TextFieldInput),
          'github.com/Leoocast',
        );

        // ACT
        await tester.tap(button);
        await tester.pump();

        card = find.byType(UrlCard);
        expect(card, findsNothing);
      },
    );
    testWidgets(
      "GIVEN the TextFieldInput with value 'https://github.com/Leoocast' THEN SaveButton is enable",
      (WidgetTester tester) async {
        // ASSEMBLE
        await tester.pumpWidget(
          const App(),
        );

        final button = find.byType(SaveButton);

        // ACT
        await tester.tap(button);

        await tester.runAsync(() async {
          await Future.delayed(const Duration(seconds: 2));
          await tester.pump();
        });

        final card = find.byType(UrlCard);

        // ASSERT
        expect(card, findsOneWidget);
      },
    );
  });
}
