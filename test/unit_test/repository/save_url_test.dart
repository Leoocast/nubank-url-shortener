import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_url_shortener/data/models/responses/url_response.dart';
import 'package:nubank_url_shortener/data/models/url.dart';
import 'package:nubank_url_shortener/data/repositories/url_repository.dart';
import '../mocks/save_url_test.mocks.dart';

@GenerateMocks([UrlRepository])
void main() {
  group("FEATURE: Register a new URL", () {
    test(
      """GIVEN an url that isn't register 
         WHEN saveUrl is called 
         THEN url response has a new shorted url 
         BUT if the url is already registered 
         THEN url response has the previous shorted url
      """,
      () async {
        final urlRepo = MockUrlRepository();

        // ARRANGE
        // Emulating a new url
        const urlToTest =
            'https://leoocast.medium.com/from-react-to-flutter-how-to-deal-with-state-management-6ca265ad8f28';

        when(
          urlRepo.saveUrl(
            any,
          ),
        ).thenAnswer(
          (_) async => UrlResponse(
            alias: '64640',
            links: UrlResponseLinks(
              self: urlToTest,
              short: "https://url-shortener-nu.herokuapp.com/short/64640",
            ),
          ),
        );

        // ACT
        final result = await urlRepo.saveUrl(Url(urlToTest));

        // ASSERT
        expect(result?.alias, '64640');
        expect(result?.links?.self, urlToTest);
        expect(result?.links?.short,
            'https://url-shortener-nu.herokuapp.com/short/64640');
      },
    );

    test(
      """GIVEN a bad url
         WHEN saveUrl is called 
         THEN url response has a custom shorted url.
      """,
      () async {
        // ARRANGE
        final urlRepo = UrlRepository();

        // ACT
        final result = await urlRepo.saveUrl(Url('Not valid URL'));

        // ASSERT
        //This alias is because is already registered
        expect(result?.alias, '57805');
        expect(result?.links?.self, 'Not valid URL');
        expect(result?.links?.short,
            'https://url-shortener-nu.herokuapp.com/short/57805');
      },
    );
  });
}
