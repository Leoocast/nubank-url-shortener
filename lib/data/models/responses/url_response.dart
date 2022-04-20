class UrlResponse {
  final String? alias;
  final _UrlResponseLinks? links;

  UrlResponse({this.alias, this.links});

  factory UrlResponse.fromJson(dynamic json) => UrlResponse(
        alias: json['alias'],
        links: _UrlResponseLinks(
          self: json['_links']['self'],
          short: json['_links']['short'],
        ),
      );
}

class _UrlResponseLinks {
  final String? self;
  final String? short;

  _UrlResponseLinks({this.self, this.short});
}
