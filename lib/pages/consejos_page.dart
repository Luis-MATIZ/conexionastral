import 'package:flutter/material.dart';
import 'package:conexion_astral/services/consejos_service.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class ConsejosPage extends StatelessWidget {
  const ConsejosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final consejosService = Provider.of<ConsejosService>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: consejosService.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: consejosService.consejos.length,
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemBuilder: (context, int index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'consejo',
                      arguments: consejosService.consejos[index],
                    );
                  },
                  child: ConsejoCard(consejo: consejosService.consejos[index]),
                ),
              ),
      ),
    );
  }
}
