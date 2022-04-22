import 'package:flutter/material.dart';
import 'package:nubank_url_shortener/domain/contexts/url_context.dart';
import 'package:nubank_url_shortener/ui/pages/home/widgets/url_card.dart';
import 'package:reactter/reactter.dart';

class UrlList extends ReactterComponent<UrlContext> {
  const UrlList({Key? key}) : super(key: key);

  @override
  listen(ctx) => [ctx.urlList];

  @override
  Widget render(ctx) {
    final listLength = ctx.urlList.value.length;

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: listLength,
        itemBuilder: (BuildContext context, int index) {
          //Reversed list
          final url = ctx.urlList.value[(listLength - 1) - index];

          return UrlCard(url: url, index: index);
        },
      ),
    );
  }
}
