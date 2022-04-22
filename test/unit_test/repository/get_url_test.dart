import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_url_shortener/data/repositories/url_repository.dart';

void main() {
  group("FEATURE: Trying to obtain an url previous registered", () {
    // ARRANGE
    final urlRepo = UrlRepository();

    test(
      "GIVEN the id '96480' WHEN getUrl is called THEN url response is 'https://pub.dev/packages/reactter'",
      () async {
        // ACT
        final result = await urlRepo.getUrl('96480');

        // ASSERT
        expect(result?.url, 'https://pub.dev/packages/reactter');
      },
    );

    test(
      "GIVEN the id '' WHEN getUrl is called THEN url response 'null'",
      () async {
        // ACT
        final result = await urlRepo.getUrl('');

        // ASSERT
        expect(result, null);
      },
    );
    test(
      "GIVEN a random id isn't register like '99854' WHEN getUrl is called THEN url response is 'null'",
      () async {
        // ACT
        final result = await urlRepo.getUrl('99854');

        // ASSERT
        expect(result, null);
      },
    );
  });
}
