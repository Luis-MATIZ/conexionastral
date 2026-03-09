import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Consejos'),
        BottomNavigationBarItem(
          icon: Icon(Icons.self_improvement),
          label: 'Rituales',
        ),
      ],
    );
  }
}
