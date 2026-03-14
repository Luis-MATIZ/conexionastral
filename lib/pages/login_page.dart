import 'package:flutter/material.dart';
import 'package:conexion_astral/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundLogin(
        child: SingleChildScrollView(
          child: Column(children: [SizedBox(height: 250), CardContainer()]),
        ),
      ),
    );
  }
}
