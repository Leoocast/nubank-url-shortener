import 'package:nubank_url_shortener/data/models/responses/url_response.dart';
import 'package:nubank_url_shortener/data/repositories/url_repository.dart';
import 'package:nubank_url_shortener/data/models/url.dart';
import 'package:reactter/reactter.dart';

enum UrlContextState { loading, ready }

class UrlContext extends ReactterContext {
  final _urlRepo = UrlRepository();

  late final inputValue = UseState<String>("", context: this);

  late final state =
      UseState<UrlContextState>(UrlContextState.ready, context: this);

  late final urlList = UseState<List<UrlResponse>>([], context: this);

  onSaveUrl() async {
    state.value = UrlContextState.loading;

    final result = await _urlRepo.saveUrl(Url(inputValue.value));

    if (result != null) {
      urlList.value = [...urlList.value, result];
    }

    inputValue.value = "";
    state.value = UrlContextState.ready;
  }
}
