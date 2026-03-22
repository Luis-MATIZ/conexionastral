import 'package:conexion_astral/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF2a5298),
              child: Icon(Icons.person_outline, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 15),

            Text(
              Preferences.name.toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 30),

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
                      onEdit: () => _showEditNameDialog(context),
                    ),
                    const Divider(height: 1, indent: 60),
                    _ProfileTile(
                      icon: Icons.cake,
                      label: "Fecha de nacimiento:",
                      value: Preferences.nacimiento,
                      onEdit: () => _showEditDateDialog(context),
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

  void _showEditNameDialog(BuildContext context) {
    final textController = TextEditingController(text: Preferences.name);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Editar Nombre'),
        content: TextField(controller: textController),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Preferences.name = textController.text;
              setState(() {});
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  Future<void> _showEditDateDialog(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 6570)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Color(0xFF2a5298)),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      Preferences.nacimiento = DateFormat('yyyy-MM-dd').format(picked);

      int day = picked.day;
      int month = picked.month;
      String nuevoSigno = "";

      switch (month) {
        case 1:
          nuevoSigno = (day <= 19) ? "Capricornio" : "Acuario";
          break;
        case 2:
          nuevoSigno = (day <= 18) ? "Acuario" : "Piscis";
          break;
        case 3:
          nuevoSigno = (day <= 20) ? "Piscis" : "Aries";
          break;
        case 4:
          nuevoSigno = (day <= 19) ? "Aries" : "Tauro";
          break;
        case 5:
          nuevoSigno = (day <= 20) ? "Tauro" : "Géminis";
          break;
        case 6:
          nuevoSigno = (day <= 20) ? "Géminis" : "Cáncer";
          break;
        case 7:
          nuevoSigno = (day <= 22) ? "Cáncer" : "Leo";
          break;
        case 8:
          nuevoSigno = (day <= 22) ? "Leo" : "Virgo";
          break;
        case 9:
          nuevoSigno = (day <= 22) ? "Virgo" : "Libra";
          break;
        case 10:
          nuevoSigno = (day <= 22) ? "Libra" : "Escorpio";
          break;
        case 11:
          nuevoSigno = (day <= 21) ? "Escorpio" : "Sagitario";
          break;
        case 12:
          nuevoSigno = (day <= 21) ? "Sagitario" : "Capricornio";
          break;
      }

      Preferences.signo = nuevoSigno;

      setState(() {});
    }
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onEdit; // Nueva propiedad opcional

  const _ProfileTile({
    required this.icon,
    required this.label,
    required this.value,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFF2a5298),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      subtitle: Text(
        value,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      trailing: onEdit != null
          ? IconButton(
              icon: const Icon(Icons.edit_outlined, size: 20),
              onPressed: onEdit,
            )
          : null,
    );
  }
}
