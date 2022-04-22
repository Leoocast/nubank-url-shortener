import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_url_shortener/utils/validations.dart';

void main() {
  group("FEATURE: Validating URL message", () {
    test(
      "GIVEN the url 'https://www.google.com' WHEN validateUrl is called THEN result is 'null'",
      () async {
        // ACT
        final result = validateUrlMessage('https://www.google.com');

        // ASSERT
        expect(result, null);
      },
    );
    test(
      "GIVEN the url '' WHEN validateUrlMessage is called THEN result is 'null'",
      () async {
        // ACT
        final result = validateUrlMessage('');

        // ASSERT
        expect(result, null);
      },
    );

    test(
      "GIVEN the url 'google.com' WHEN validateUrlMessage is called THEN result is 'Url is not valid'",
      () async {
        // ACT
        final result = validateUrlMessage('google.com');

        // ASSERT
        expect(result, 'Url is not valid');
      },
    );
  });
}
