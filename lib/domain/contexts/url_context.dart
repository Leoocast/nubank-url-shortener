import 'package:nubank_url_shortener/data/models/responses/url_response.dart';
import 'package:nubank_url_shortener/data/repositories/url_repository.dart';
import 'package:reactter/reactter.dart';

enum UrlContextState { loading, ready }

class UrlContext extends ReactterContext {
  final _urlRepo = UrlRepository();
  final inputValue = UseState<String>("");

  late final state =
      UseState<UrlContextState>(UrlContextState.ready, context: this);

  late final urlList = UseState<List<UrlResponse>>([
    UrlResponse(
      url: "youtube.com",
      links:
          UrlResponseLinks(self: 'youtube.com', short: 'shorted.youtube.com'),
    ),
    UrlResponse(
      url: "google.com",
      links: UrlResponseLinks(self: 'google.com', short: 'shorted.google.com'),
    ),
  ], context: this);

  @override
  void awake() async {
    super.awake();
    final url = await _urlRepo.getUrl('55563');

    print("Awakening!");
  }

  onSaveUrl() async {
    state.value = UrlContextState.loading;

    await Future.delayed(const Duration(milliseconds: 1500));

    state.value = UrlContextState.ready;
    inputValue.value = "";
    urlList.value = [
      ...urlList.value,
      UrlResponse(
        url: "youtube.com",
        links:
            UrlResponseLinks(self: 'youtube.com', short: 'shorted.youtube.com'),
      ),
    ];
  }
}
