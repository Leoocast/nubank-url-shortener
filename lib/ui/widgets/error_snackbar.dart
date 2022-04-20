import 'package:flutter/material.dart';

class ErrorSnackbar extends SnackBar {
  final String text;

  ErrorSnackbar({Key? key, this.text = ""})
      : super(
          key: key,
          backgroundColor: Colors.red.shade900,
          content: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
}
