import 'package:conexion_astral/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:conexion_astral/services/consejos_service.dart';
import 'package:conexion_astral/pages/pages.dart';
import 'package:conexion_astral/providers/ui_provider.dart';
import 'package:conexion_astral/services/rituales_service.dart';
import 'package:conexion_astral/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => RitualesService()),
        ChangeNotifierProvider(create: (_) => ConsejosService()),
      ],
      child: MaterialApp(
        title: 'Conexión Astral',
        debugShowCheckedModeBanner: false,
        initialRoute: Preferences.name == '' ? 'login' : 'home',
        routes: {
          'home': (_) => HomePage(),
          'login': (_) => LoginPage(),
          'consejos': (_) => ConsejosPage(),
          'rituales': (_) => RitualesPage(),
          'settings': (_) => SettingsPage(),
          'profile': (_) => ProfilePage(),
          'ritual': (_) => RitualPage(),
          'consejo': (_) => ConsejoPage(),
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
