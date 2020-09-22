class User {
  int id;
  String first_name;
  String last_name;
  String username;
  String password;

  User(this.first_name, this.last_name, this.username);
  User.full(this.first_name, this.last_name, this.username, this.password);
  User.authenticate(this.id, this.first_name, this.last_name, this.username);
  User.empty();

  factory User.fromMap(Map json) {
    return User(
      json['first_name'],
      json['last_name'],
      json['username'],
    );
  }

  factory User.fromMapAuthenticate(Map json) {
    return User.authenticate(
      json['user']['id'],
      json['user']['firt_name'],
      json['user']['last_name'],
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
