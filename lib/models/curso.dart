import 'package:educap/models/university.dart';

class Course {
  int id;
  String shift;
  int modality;
  int group;
  University university;

  Course(this.id, this.shift, this.modality, this.group, this.university);
  Course.empty();

  factory Course.fromMap(Map json) {
    return Course(json['id'], json['turno'], json['modalidade'], json['grupo'],
        University.fromMap(json['id_university']));
  }
}
