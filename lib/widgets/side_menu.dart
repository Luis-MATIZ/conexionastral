import 'package:flutter/material.dart';
import 'package:conexion_astral/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerHeader(),

          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
              Provider.of<UiProvider>(context, listen: false).selectedMenuOpt =
                  3;
            },
          ),

          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Configuración'),
            onTap: () {
              Navigator.pop(context);
              Provider.of<UiProvider>(context, listen: false).selectedMenuOpt =
                  4;
            },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Desconectarse'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(child: Container());
  }
}
