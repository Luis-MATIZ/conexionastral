import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  final Widget child;
  const BackgroundLogin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [_HeaderLogin(), child]),
    );
  }
}

class _HeaderLogin extends StatelessWidget {
  const _HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _headerDecoration(),
    );
  }

  BoxDecoration _headerDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF1e3c72), // Azul profundo
          Color(
            0xFF2a5298,
          ), // Azul medio // Gris nube (genera un contraste metálico)
        ],
      ),
    );
  }
}
