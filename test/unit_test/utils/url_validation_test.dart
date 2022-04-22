import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_url_shortener/utils/validations.dart';

void main() {
  group("FEATURE: Validating URL message", () {
    test(
      "GIVEN the url 'https://github.com/Leoocast/reactter' WHEN validateUrl is called THEN result is 'null'",
      () async {
        // ACT
        final result =
            validateUrlMessage('https://github.com/Leoocast/reactter');

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
      "GIVEN the url '2devs.io' WHEN validateUrlMessage is called THEN result is 'Url is not valid'",
      () async {
        // ACT
        final result = validateUrlMessage('2devs.io');

        // ASSERT
        expect(result, 'Url is not valid');
      },
    );
  });
}
