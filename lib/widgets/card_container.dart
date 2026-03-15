import 'package:conexion_astral/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:conexion_astral/ui/ui.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [_createCardShape()],
        ),
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            _LoginForm(),
          ],
        ),
      ),
    );
  }

  BoxShadow _createCardShape() {
    return BoxShadow(
      color: Colors.black26,
      blurRadius: 15,
      offset: Offset(0, 5),
    );
  }
}

class _LoginForm extends StatelessWidget {
  _LoginForm({super.key});
  final TextEditingController _fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.name,
            decoration: InputDecorationUI.authInputDecoration(
              prefixIcon: Icons.person,
              hintText: 'Escriba su nombre',
              labelText: 'Nombre de usuario',
            ),
          ),
          SizedBox(height: 30),
          CustomDialogDatePicker(
            controller: _fechaController,
            label: "Fecha de nacimiento",
          ),
          SizedBox(height: 30),
          MaterialButton(
            onPressed: () {},
            disabledColor: Colors.grey,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
              ),
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                'Enviar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
