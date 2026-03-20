import 'package:flutter/material.dart';
import 'package:conexion_astral/services/rituales_service.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class RitualesPage extends StatelessWidget {
  const RitualesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ritualesService = Provider.of<RitualesService>(context);
    print(ritualesService.rituales.length);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: ritualesService.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: ritualesService.rituales.length,
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemBuilder: (context, int index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'ritual',
                      arguments: ritualesService.rituales[index],
                    );
                  },
                  child: RitualCard(ritual: ritualesService.rituales[index]),
                ),
              ),
      ),
    );
  }
}
