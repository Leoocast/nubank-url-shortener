final urlRegExp = RegExp(
  r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)",
  caseSensitive: false,
  multiLine: false,
);

String? validateUrl(String value) {
  if (value == "") {
    return null;
  }

  if (!urlRegExp.hasMatch(value)) {
    return 'Url is not valid';
  }

  return null;
}
