import 'package:flutter/material.dart';

class RitualCard extends StatelessWidget {
  const RitualCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Rituales #1'),
            subtitle: Text(
              'Soy un texto probando el texto del textoSoy un texto probando el texto del textoSoy un texto probando el texto del textoSoy un texto probando el texto del texto',
            ),
          ),
        ],
      ),
    );
  }
}
