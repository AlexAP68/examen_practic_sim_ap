import 'dart:convert';

class User {
  User({
    this.id,
    required this.address,
    required this.email,
    required this.name,
    required this.phone,
    required this.photo,
  });

  String? id;
  String address;
  String email;
  String name;
  String phone;
  String photo;

  // Convertir de JSON (String) a User
  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  // Convertir de User a JSON (String)
  String toJson() => json.encode(toMap());

  // Crear un User a partir de un Map
  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        address: json["address"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        photo: json["photo"],
      );

  // Convertir un User a Map
  Map<String, dynamic> toMap() => {
        "id": id,
        "address": address,
        "email": email,
        "name": name,
        "phone": phone,
        "photo": photo,
      };

  // Método para crear una copia de un User con la posibilidad de cambiar algunos campos
  User copy({
    String? id,
    String? address,
    String? email,
    String? name,
    String? phone,
    String? photo,
  }) =>
      User(
        id: id ?? this.id,
        address: address ?? this.address,
        email: email ?? this.email,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        photo: photo ?? this.photo,
      );
}
