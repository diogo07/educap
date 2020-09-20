import 'package:educap/models/city.dart';

class University {
  int id;
  String name;
  String department;
  City city;
  String category;

  University(this.id, this.name, this.department, this.city, this.category);
  University.empty();

  factory University.fromMap(Map json) {
    return University(
      json['id'],
      json['nome'],
      json['departamento'],
      City.fromMap(json['id_municipio']),
      json['categoria'],
    );
  }

  static List<University> toList(List list) {
    return list.map((e) => University.fromMap(e)).toList();
  }
}
