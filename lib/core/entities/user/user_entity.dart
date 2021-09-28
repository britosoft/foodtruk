class EUser {
  EUser({
    this.id,
    this.nombre,
    this.password,
    this.token,
    this.email,
  });

  String? id;
  String? nombre;
  String? password;
  String? token;
  String? email;

  factory EUser.fromJson(Map<String, dynamic> json) => EUser(
        id: json["id"] == null ? null : json["id"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        password: json["password"] == null ? null : json["password"],
        token: json["token"] == null ? null : json["token"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nombre": nombre == null ? null : nombre,
        "password": password == null ? null : password,
        "token": token == null ? null : token,
        "email": email == null ? null : email,
      };
}
