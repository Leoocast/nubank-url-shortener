import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_url_shortener/data/models/url.dart';
import 'package:nubank_url_shortener/data/repositories/url_repository.dart';

class MockClient extends Mock implements HttpClient {}

void main() {
  group("FEATURE: Register a new URL", () {
    final urlRepo = UrlRepository();

    test(
      """GIVEN an url that isn't register 
         WHEN saveUrl is called 
         THEN url response has a new shorted url 
         BUT if the url is already registered 
         THEN url response has the previous shorted url
      """,
      () async {
        // ARRANGE
        when(urlRepo.getUrl("asd")).thenAnswer((_) async => Url("Que pedorro"));

        final test = urlRepo.getUrl("asd");

        // ASSERT
        expect(test, 'https://pub.dev/packages/reactter');
      },
    );

    test(
      "GIVEN the id '' WHEN getUrl is called THEN url response null",
      () async {
        // ACT
        final result = await urlRepo.getUrl('');

        // ASSERT
        expect(result, null);
      },
    );
  });
}
