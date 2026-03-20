import 'package:flutter/material.dart';
import 'package:conexion_astral/models/ritual.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class RitualPage extends StatelessWidget {
  const RitualPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Ritual ritual = ModalRoute.of(context)!.settings.arguments as Ritual;
    return Scaffold(
      appBar: AppBar(title: Text('Conexión Astral')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ritual.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              FadeInImage(
                image: NetworkImage(ritual.picture),
                placeholder: AssetImage('assets/images/jar-loading.gif'),
                width: double.infinity,
                height: 230,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(ritual.date, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              MarkdownBody(
                data: ritual.body.replaceAll("\\n", "\n"),
                selectable: true,
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
