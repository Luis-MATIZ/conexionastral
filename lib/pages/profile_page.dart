import 'package:conexion_astral/preferences/preferences.dart';
import 'package:flutter/material.dart';
// Importa tus preferencias para leer los datos reales
// import 'package:conexion_astral/preferences/preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulamos los datos (Aquí usarías Preferences.nombre y Preferences.nacimiento)
    final String nombreUsuario = "Luis";
    final String fechaNacimiento = "1994-05-04";

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person_outline, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 15),

            Text(
              Preferences.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 30),

            // --- TARJETA DE INFORMACIÓN ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _ProfileTile(
                      icon: Icons.person,
                      label: "Nombre:",
                      value: Preferences.name,
                    ),
                    const Divider(height: 1, indent: 60),
                    _ProfileTile(
                      icon: Icons.cake,
                      label: "Fecha de nacimiento:",
                      value: Preferences.nacimiento,
                    ),
                    const Divider(height: 1, indent: 60),
                    _ProfileTile(
                      icon: Icons.auto_awesome,
                      label: "Signo del zodiaco:",
                      value: Preferences.signo,
                    ),
                    const Divider(height: 1, indent: 60),
                    _ProfileTile(
                      icon: Icons.self_improvement,
                      label: "Estado",
                      value: "Conectado con el cosmos",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget auxiliar para las filas del perfil
class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.indigo, size: 20),
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
