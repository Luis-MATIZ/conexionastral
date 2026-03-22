import 'package:conexion_astral/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../ui/input_decoration_ui.dart';

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
      readOnly: true,
      decoration: InputDecorationUI.authInputDecoration(
        labelText: label,
        prefixIcon: Icons.calendar_month,
        hintText: 'Seleccione su fecha de nacimiento',
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
      //locale: const Locale('es', 'ES'),
      initialDate: DateTime.now().subtract(const Duration(days: 6570)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
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
      controller.text = DateFormat('dd/MM/yyyy').format(picked);
      Preferences.nacimiento = DateFormat('yyyy-MM-dd').format(picked);

      int day = picked.day;
      int month = picked.month;
      String signo = "";

      switch (month) {
        case 1:
          signo = (day <= 19) ? "Capricornio" : "Acuario";
          break;
        case 2:
          signo = (day <= 18) ? "Acuario" : "Piscis";
          break;
        case 3:
          signo = (day <= 20) ? "Piscis" : "Aries";
          break;
        case 4:
          signo = (day <= 19) ? "Aries" : "Tauro";
          break;
        case 5:
          signo = (day <= 20) ? "Tauro" : "Géminis";
          break;
        case 6:
          signo = (day <= 20) ? "Géminis" : "Cáncer";
          break;
        case 7:
          signo = (day <= 22) ? "Cáncer" : "Leo";
          break;
        case 8:
          signo = (day <= 22) ? "Leo" : "Virgo";
          break;
        case 9:
          signo = (day <= 22) ? "Virgo" : "Libra";
          break;
        case 10:
          signo = (day <= 22) ? "Libra" : "Escorpio";
          break;
        case 11:
          signo = (day <= 21) ? "Escorpio" : "Sagitario";
          break;
        case 12:
          signo = (day <= 21) ? "Sagitario" : "Capricornio";
          break;
      }

      Preferences.signo = signo;
    }
  }
}
