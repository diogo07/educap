import 'package:educap/models/course.dart';

class Enade {
  int id;
  int year;
  String ageStudent;
  String sexStudent;
  int yearConclusionEducationMedicalStudent;
  int yearStartGraduationStudent;
  Course course;
  int sales;

  Enade(
      this.id,
      this.year,
      this.ageStudent,
      this.sexStudent,
      this.yearConclusionEducationMedicalStudent,
      this.yearStartGraduationStudent,
      this.course);

  Enade.custom(this.year, this.sales);
  Enade.empty();

  factory Enade.fromMap(Map json) {
    return Enade.custom(
      json['ano_enade'],
      json['total'],
    );
  }

  static List<Enade> toList(List list) {
    List<Enade> listEnade = List<Enade>();
    list.forEach((item) {
      listEnade.add(Enade.custom(item['enade_ano'], item['total']));
    });
    return listEnade;
  }
}
