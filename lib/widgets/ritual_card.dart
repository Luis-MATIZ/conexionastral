import 'package:flutter/material.dart';

class RitualCard extends StatelessWidget {
  const RitualCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(18),
      ),
      elevation: 7,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            child: FadeInImage(
              image: NetworkImage(
                'https://tvazteca.brightspotcdn.com/73/bd/ba985edb423fa5296304efac8a3b/rituales-signos.jpg',
              ),
              placeholder: AssetImage('assets/images/jar-loading.gif'),
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Rituales #1',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Soy un texto probando el texto del textoSoy un texto probando el texto del textoSoy un texto probando el texto del textoSoy un texto probando el texto del texto',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
