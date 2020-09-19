class User {
  int id;
  String first_name;
  String last_name;
  String username;
  String password;

  User(this.id, this.first_name, this.last_name, this.password, this.username);
  User.empty();

  factory User.fromMap(Map json) {
    return User(
      json['user']['id'],
      json['user']['firt_name'],
      json['user']['last_name'],
      json['user']['password'],
      json['user']['username'],
    );
  }

  Map<String, dynamic> toJson() => {
        "first_name": first_name,
        "last_name": last_name,
        "username": username,
        "password": password,
      };
}
