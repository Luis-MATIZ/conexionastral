import 'package:conexion_astral/pages/pages.dart';
import 'package:conexion_astral/providers/ui_provider.dart';
import 'package:conexion_astral/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conexión Astral')),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return Container();
      case 1:
        return ConsejosPage();

      case 2:
        return RitualesPage();

      default:
        return HomePage();
    }
  }
}
