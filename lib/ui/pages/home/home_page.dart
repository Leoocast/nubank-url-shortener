import 'package:flutter/material.dart';
import 'package:nubank_url_shortener/domain/contexts/url_context.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/send_button.dart';
import 'package:nubank_url_shortener/ui/widgets/dismissible.dart';
import 'package:nubank_url_shortener/ui/widgets/text_field.dart';
import 'package:reactter/reactter.dart';

import 'widgets/url_card.dart';

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

                    final isLoading =
                        urlContext.state.value == UrlContextState.loading;

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
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            urlContext.onSaveUrl();
                          },
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
                  Builder(builder: (context) {
                    final urlContext = context.of<UrlContext>();

                    final listLength = urlContext.urlList.value.length;

                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: listLength,
                        itemBuilder: (BuildContext context, int index) {
                          //Reversed list
                          final url = urlContext
                              .urlList.value[(listLength - 1) - index];

                          return UrlCard(url: url);
                        },
                      ),
                    );
                  })
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
