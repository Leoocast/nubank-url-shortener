import 'package:flutter/material.dart';
import 'package:nubank_url_shortener/domain/contexts/url_context.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/form.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/url_list.dart';
import 'package:nubank_url_shortener/ui/widgets/dismissible.dart';
import 'package:reactter/reactter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissibleKeyboard(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Url shortener'),
        ),
        body: Padding(
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
                  FormUrl(),
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
