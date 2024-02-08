import 'package:firebase_demo/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../ui/input_decorations.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userForm = Provider.of<UserService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: _UserForm(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (userForm.isValidForm()) {
            userForm.saveOrCreateUser();
            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

class _UserForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userForm = Provider.of<UserService>(context);
    final tempUser = userForm.tempUser;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: userForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                if (tempUser.photo.isNotEmpty) // Asegura que la URL de la foto no esté vacía
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        tempUser.photo,
                        width: 100, // Ancho de la imagen
                        height: 100, // Altura de la imagen
                        fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: tempUser.name,
                  onChanged: (value) => tempUser.name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'El nombre es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Nombre', labelText: 'Nombre:'),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: tempUser.email,
                  onChanged: (value) => tempUser.email = value,
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) return 'El correo electrónico es obligatorio y debe ser válido';
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'ejemplo@correo.com', labelText: 'Correo electrónico:'),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: tempUser.address,
                  onChanged: (value) => tempUser.address = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'La dirección es obligatoria';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Dirección completa', labelText: 'Dirección:'),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: tempUser.phone,
                  onChanged: (value) => tempUser.phone = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'El teléfono es obligatorio';
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Número de teléfono', labelText: 'Teléfono:'),
                ),
                SizedBox(height: 30),
                  TextFormField(
                  initialValue: tempUser.photo,
                  onChanged: (value) => tempUser.photo = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'URL de la foto', labelText: 'Foto:'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 5),
        ],
      );
}



