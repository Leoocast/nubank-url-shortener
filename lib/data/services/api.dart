import 'package:dio/dio.dart';

class Api {
  static final _api = Api._();

  factory Api() {
    return _api;
  }

  Api._();

  final client = Dio(
    BaseOptions(
      headers: {
        'Accept': 'application/json',
      },
      baseUrl: 'https://url-shortener-nu.herokuapp.com/',
    ),
  );
}
