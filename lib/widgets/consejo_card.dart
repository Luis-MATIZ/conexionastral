import 'package:flutter/material.dart';
import 'package:conexion_astral/models/consejo.dart';

class ConsejoCard extends StatelessWidget {
  final Consejo consejo;
  const ConsejoCard({super.key, required this.consejo});

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
              image: NetworkImage(consejo.picture),
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
                    consejo.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    consejo.description,
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
