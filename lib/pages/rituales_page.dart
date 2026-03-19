import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RitualesPage extends StatelessWidget {
  const RitualesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => SizedBox(height: 15),
          itemBuilder: (context, int index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'ritual');
            },
            child: RitualCard(),
          ),
        ),
      ),
    );
  }
}
