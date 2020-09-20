class City {
  int id;
  String name;
  String uf;

  City(this.id, this.name, this.uf);
  City.empty();

  factory City.fromMap(Map json) {
    return City(
      json['id'],
      json['nome'],
      json['uf'],
    );
  }
}
