import 'package:flutter/material.dart';
import 'package:nubank_url_shortener/domain/contexts/url_context.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/send_button.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/text_field.dart';
import 'package:nubank_url_shortener/ui/widgets/error_snackbar.dart';
import 'package:nubank_url_shortener/utils/validations.dart';
import 'package:reactter/reactter.dart';

class FormUrl extends StatelessWidget {
  final _urlInputController = TextEditingController();

  FormUrl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final urlContext = context.of<UrlContext>();

    final inputValue = urlContext.inputValue.value;

    final validateUrlCondition =
        validateUrlMessage(inputValue) == null && inputValue != "";

    final isLoading = urlContext.state.value == UrlContextState.loading;

    onPressSave() async {
      FocusManager.instance.primaryFocus?.unfocus();
      final result = await urlContext.onSaveUrl();
      _urlInputController.clear();

      if (!result) {
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbar(
            text: "Ups! something happened",
          ),
        );
      }
    }

    return Form(
      child: Row(
        children: [
          Flexible(
            child: TextFieldInput(
              controller: _urlInputController,
              inputValue: urlContext.inputValue,
              isLoading: isLoading,
            ),
          ),
          const SizedBox(width: 15),
          SaveButton(
            onPressed: validateUrlCondition ? onPressSave : null,
            isLoading: isLoading,
          )
        ],
      ),
    );
  }
}
