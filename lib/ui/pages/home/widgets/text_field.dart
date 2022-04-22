import 'package:flutter/material.dart';
import 'package:nubank_url_shortener/utils/validations.dart';
import 'package:reactter/reactter.dart';

class TextFieldInput extends StatelessWidget {
  final UseState inputValue;
  final bool isLoading;
  final TextEditingController controller;

  const TextFieldInput({
    Key? key,
    required this.inputValue,
    required this.controller,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      readOnly: isLoading,
      onChanged: (text) {
        inputValue.value = text;
      },
      validator: (value) => validateUrlMessage(value ?? ""),
      obscureText: false,
      decoration: InputDecoration(
        suffixIcon: controller.text == ""
            ? const SizedBox()
            : IconButton(
                splashRadius: 1,
                alignment: Alignment.bottomRight,
                iconSize: 20,
                onPressed: isLoading
                    ? null
                    : () {
                        controller.clear();
                        inputValue.value = "";
                      },
                icon: const Icon(Icons.close),
              ),
        hintText: "https://leoocast.medium.com",
        labelText: 'Url',
      ),
    );
  }
}
