class UrlResponse {
  final String? alias;
  final UrlResponseLinks? links;

  UrlResponse({this.alias, this.links});

  factory UrlResponse.fromJson(dynamic json) => UrlResponse(
        alias: json['alias'],
        links: UrlResponseLinks(
          self: json['_links']['self'],
          short: json['_links']['short'],
        ),
      );
}

class UrlResponseLinks {
  final String? self;
  final String? short;

  UrlResponseLinks({this.self, this.short});
}
