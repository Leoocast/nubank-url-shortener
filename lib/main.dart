import 'package:flutter/material.dart';

import 'ui/pages/home/home_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nubank app',
      initialRoute: '/',
      routes: {
        "/": (_) => const HomePage(),
      },
      theme: ThemeData.dark(),
    );
  }
}
