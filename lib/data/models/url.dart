class Url {
  final String url;
  Url(this.url);

  factory Url.fromJson(dynamic json) {
    return Url(json['url'] as String);
  }

  toMap() => {"url": url};
}
