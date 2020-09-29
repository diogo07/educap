import 'package:educap/models/university.dart';

class Course {
  int id;
  String shift;
  int modality;
  int group;
  University university;

  Course(this.id, this.shift, this.modality, this.group, this.university);
  Course.lazy(this.id, this.shift, this.modality, this.group);
  Course.empty();

  factory Course.fromMap(Map json) {
    return Course(json['id'], json['turno'], json['modalidade'],
        json['codigo_grupo'], University.fromMap(json['id_university']));
  }

  factory Course.fromMapLazy(Map json) {
    return Course.lazy(
        json['id'], json['turno'], json['modalidade'], json['codigo_grupo']);
  }

  static List<Course> toList(List list) {
    return list.map((e) => Course.fromMapLazy(e)).toList();
  }
}
