import 'package:flutter/material.dart';
import 'package:nubank_url_shortener/domain/contexts/url_context.dart';
import 'package:nubank_url_shortener/ui/widgets/error_snackbar.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/send_button.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/url_list.dart';
import 'package:nubank_url_shortener/ui/widgets/dismissible.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/text_field.dart';
import 'package:nubank_url_shortener/utils/validations.dart';
import 'package:reactter/reactter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Url shortener'),
      ),
      body: DismissibleKeyboard(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: UseProvider(
            contexts: [
              UseContext(
                () => UrlContext(),
              ),
            ],
            builder: (context, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(builder: (context) {
                    final urlContext = context.of<UrlContext>();

                    final inputValue = urlContext.inputValue.value;
                    final validateUrlCondition =
                        validateUrlMessage(inputValue) == null &&
                            inputValue != "";

                    final isLoading =
                        urlContext.state.value == UrlContextState.loading;

                    onPressSave() async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      final result = await urlContext.onSaveUrl();

                      if (!result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          ErrorSnackbar(
                            text: "Ups! something happened",
                          ),
                        );
                      }
                    }

                    return Row(
                      children: [
                        Flexible(
                          child: TextFieldInput(
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
                    );
                  }),
                  const SizedBox(height: 25),
                  const Text(
                    "Recently shortened URLs:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const UrlList()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
