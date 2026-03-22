import 'package:flutter/material.dart';
import 'package:conexion_astral/services/rituales_service.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class RitualesPage extends StatelessWidget {
  const RitualesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ritualesService = Provider.of<RitualesService>(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ritualesService.loadRituales(),
        color: Color(0xFF2a5298),
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: _buildBody(ritualesService, context),
        ),
      ),
    );
  }

  Widget _buildBody(RitualesService ritualesService, BuildContext context) {
    if (ritualesService.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF2a5298)),
      );
    }

    if (ritualesService.rituales.isEmpty) {
      return ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          const Icon(Icons.wifi_off_rounded, size: 80, color: Colors.grey),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'No hay conexión con el cosmos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(child: Text('Revisa tu conexión e inténtalo de nuevo')),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              onPressed: () => ritualesService.loadRituales(),
              child: const Text(
                'Reintentar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 50),
      physics: const AlwaysScrollableScrollPhysics(),
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
    );
  }
}
