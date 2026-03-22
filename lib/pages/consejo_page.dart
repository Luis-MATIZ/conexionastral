import 'package:flutter/material.dart';
import 'package:conexion_astral/models/consejo.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class ConsejoPage extends StatelessWidget {
  const ConsejoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Consejo consejo =
        ModalRoute.of(context)!.settings.arguments as Consejo;
    return Scaffold(
      appBar: AppBar(title: Text('Conexión Astral')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                consejo.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              FadeInImage(
                image: NetworkImage(consejo.picture),
                placeholder: AssetImage('assets/images/jar-loading.gif'),
                width: double.infinity,
                height: 230,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(consejo.date, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              MarkdownBody(
                data: consejo.body.replaceAll("\\n", "\n"),
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
