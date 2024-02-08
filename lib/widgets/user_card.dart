import '../models/models.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User usuari;
  const UserCard({super.key, required this.usuari});

  @override
  Widget build(BuildContext context) {
    // Asumiendo que 'name' es una cadena y 'email' también.
    return ListTile(
      leading: CircleAvatar(child: Text(usuari.name[0])), // Muestra la primera letra del nombre
      title: Text(usuari.name), // Muestra el nombre del usuario
      subtitle: Text(
        usuari.email, // Muestra el email del usuario
        style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
    );
  }
}
