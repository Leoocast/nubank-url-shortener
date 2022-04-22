import 'package:flutter/material.dart';
import 'package:nubank_url_shortener/utils/validations.dart';
import 'package:reactter/reactter.dart';

class TextFieldInput extends StatefulWidget {
  final UseState inputValue;
  final bool isLoading;

  const TextFieldInput({
    Key? key,
    required this.inputValue,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  final _urlInputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    widget.inputValue.didUpdate(
      (oldValue, newValue) {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _urlInputController,
      readOnly: widget.isLoading,
      onChanged: (text) {
        widget.inputValue.value = text;
      },
      validator: (value) => validateUrlMessage(value ?? ""),
      obscureText: false,
      decoration: InputDecoration(
        suffixIcon: widget.inputValue.value == ""
            ? const SizedBox()
            : IconButton(
                splashRadius: 1,
                alignment: Alignment.bottomRight,
                iconSize: 20,
                onPressed:
                    widget.isLoading ? null : () => _urlInputController.clear(),
                icon: const Icon(Icons.close),
              ),
        hintText: "https://leoocast.medium.com",
        labelText: 'Url',
      ),
    );
  }
}
