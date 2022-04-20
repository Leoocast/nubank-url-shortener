import 'package:nubank_url_shortener/data/models/responses/url_response.dart';
import 'package:nubank_url_shortener/data/services/api.dart';
import 'package:nubank_url_shortener/data/models/url.dart';

class UrlRepository {
  final _client = Api().client;
  final _route = "/api/alias";

  //Testing porpuses
  Future<Url> getUrl(String id) async {
    final response = await _client.get(_route + "/55563");

    final url = Url.fromJson(response.data);

    return url;
  }

  Future<UrlResponse?> saveUrl(Url url) async {
    try {
      final response = await _client.post(_route, data: url.toMap());

      final urlResponse = UrlResponse.fromJson(response.data);

      return urlResponse;
    } catch (e) {
      return null;
    }
  }
}
