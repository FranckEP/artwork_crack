class User {
  String id;
  String name;
  String email;
  String tokenNotification;
  String urlPerfilPicture;

  User({required this.id, required this.name, required this.email, required this.tokenNotification, required this.urlPerfilPicture});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json["id"] as String, name: json["name"] as String, email: json["email"] as String, tokenNotification: json["tokenNotification"] as String, urlPerfilPicture: json["urlPerfilPicture"] as String);
  }

  String toJsonToString() {
    String c = "{\"id\":" + "\"$id\"," + "\"name\":" + "\"$name\"," + "\"email\":" + "\"$email\"," + "\"tokenNotification\":" + "\"$tokenNotification\"," + "\"urlPerfilPicture\":" + "\"$urlPerfilPicture\"}";
    return c;
  }

  @override
  String toString() {
    return "============================== Begin User =============================="
        "\nid: $id \nname: $name \nemail: $email"
        "\n==============================End User==============================";
  }
}
