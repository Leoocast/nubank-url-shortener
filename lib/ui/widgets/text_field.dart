import 'package:flutter/material.dart';
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
  final urlInputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    widget.inputValue.didUpdate(
      (oldValue, newValue) {
        if (newValue == "") {
          urlInputController.text = newValue;
          setState(() {});
        }
      },
    );

    urlInputController.addListener(
      () => setState(
        () {
          widget.inputValue.value = urlInputController.text;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: widget.isLoading,
      controller: urlInputController,
      obscureText: false,
      decoration: InputDecoration(
        suffixIcon: urlInputController.text.isEmpty
            ? const SizedBox()
            : IconButton(
                splashRadius: 1,
                alignment: Alignment.bottomRight,
                iconSize: 20,
                onPressed: widget.isLoading
                    ? null
                    : () => widget.inputValue.value = "",
                icon: const Icon(Icons.close),
              ),
        hintText: "https://leoocast.medium.com",
        labelText: 'Url',
      ),
    );
  }
}
