// Mocks generated by Mockito 5.1.0 from annotations
// in nubank_url_shortener/test/unit_test/save_url_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:nubank_url_shortener/data/models/responses/url_response.dart'
    as _i5;
import 'package:nubank_url_shortener/data/models/url.dart' as _i4;
import 'package:nubank_url_shortener/data/repositories/url_repository.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [UrlRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUrlRepository extends _i1.Mock implements _i2.UrlRepository {
  MockUrlRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Url?> getUrl(String? id) =>
      (super.noSuchMethod(Invocation.method(#getUrl, [id]),
          returnValue: Future<_i4.Url?>.value()) as _i3.Future<_i4.Url?>);
  @override
  _i3.Future<_i5.UrlResponse?> saveUrl(_i4.Url? url) =>
      (super.noSuchMethod(Invocation.method(#saveUrl, [url]),
              returnValue: Future<_i5.UrlResponse?>.value())
          as _i3.Future<_i5.UrlResponse?>);
}