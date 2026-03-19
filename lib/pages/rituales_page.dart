import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RitualesPage extends StatelessWidget {
  const RitualesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, int index) => GestureDetector(
          onTap: () {
            print('Accedineto al churumbel');
          },
          child: RitualCard(),
        ),
      ),
    );
  }
}
