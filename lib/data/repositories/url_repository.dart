import 'package:nubank_url_shortener/data/services/api.dart';
import 'package:nubank_url_shortener/domain/entities/url.dart';

class UrlRepository {
  final _client = Api().client;
  final _segment = "/api/alias";

  //Testing porpuses
  Future<Url> getUrl(String id) async {
    final response = await _client.get(_segment + "/55563");

    final url = Url.fromJson(response.data);

    return url;
  }
}
