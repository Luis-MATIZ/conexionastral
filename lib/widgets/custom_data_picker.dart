import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDialogDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const CustomDialogDatePicker({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.arrow_drop_down_circle_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onTap: () => _showCenteredDatePicker(context),
    );
  }

  void _showCenteredDatePicker(BuildContext context) {
    // Definimos una fecha temporal para capturar el cambio
    DateTime tempDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        // Usamos Dialog para tener el fondo semitransparente y el cuadro centrado
        return Dialog(
          backgroundColor:
              Colors.transparent, // Fondo transparente alrededor del diálogo
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ), // Margen externo
          child: Container(
            width: 320, // Ancho fijo o ajustado según tus necesidades
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                16,
              ), // Bordes redondeados como en la foto
            ),
            child: Column(
              children: [
                // El selector estilo rueda (ahora centrado dentro del Diálogo)
                Expanded(
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        // Esto ayuda a que el estilo del texto sea más claro
                        dateTimePickerTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime.now(),
                      minimumYear: 1900,
                      maximumYear: 2100,
                      onDateTimeChanged: (DateTime newDate) {
                        tempDate = newDate;
                      },
                    ),
                  ),
                ),
                // Barra inferior de acciones (como en tu foto original)
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9F9F9), // Un gris muy claro para el fondo
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Botón Cancelar (como en la foto)
                      Expanded(
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      // Separador vertical fino (opcional, para dar el toque pro)
                      Container(width: 0.5, height: 40, color: Colors.grey),
                      // Botón OK (como en la foto)
                      Expanded(
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: const Text(
                            'OK',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            controller.text = DateFormat(
                              'dd/MM/yyyy',
                            ).format(tempDate);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
