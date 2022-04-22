import 'package:nubank_url_shortener/utils/regex.dart';

String? validateUrlMessage(String value) {
  if (value == "") {
    return null;
  }

  if (!urlRegExp.hasMatch(value)) {
    return 'Url is not valid';
  }

  return null;
}
