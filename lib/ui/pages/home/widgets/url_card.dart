import 'package:flutter/material.dart';
import 'package:nubank_url_shortener/data/models/responses/url_response.dart';

class UrlCard extends StatelessWidget {
  final UrlResponse url;

  const UrlCard({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      child: Column(
        children: [
          // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            title: Text(url.url ?? ""),
            dense: false,
            subtitle: Text(url.links?.short ?? ""),
          ),
        ],
      ),
    );
  }
}

class FadeInDown {}
