import 'package:conexion_astral/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../ui/input_decoration_ui.dart'; // Recuerda añadir 'intl' en tu pubspec.yaml

class BirthDateField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const BirthDateField({
    super.key,
    required this.controller,
    this.label = 'Fecha de Nacimiento',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true, // Crucial: evita el teclado físico
      decoration: InputDecorationUI.authInputDecoration(
        labelText: label,
        prefixIcon: Icons.calendar_month,
        hintText: 'Escriba su fecha de nacimiento',
      ),
      onTap: () => _selectDate(context),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Este campo es obligatorio';
        return null;
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(
        const Duration(days: 6570),
      ), // Default 18 años
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      // Personalización opcional del tema del calendario
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // Formateo profesional usando la librería intl
      controller.text = DateFormat('dd/MM/yyyy').format(picked);
      Preferences.nacimiento = picked.toString();
    }
  }
}
