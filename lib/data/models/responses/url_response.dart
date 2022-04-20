class UrlResponse {
  final String? url;
  final UrlResponseLinks? links;

  UrlResponse({this.url, this.links});
}

class UrlResponseLinks {
  final String? self;
  final String? short;

  UrlResponseLinks({this.self, this.short});
}
