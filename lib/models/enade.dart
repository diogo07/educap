import 'package:educap/models/curso.dart';
import 'package:educap/pages/analisy_enade/analyze_enade_controller.dart';

class Enade {
  int id;
  int year;
  String ageStudent;
  String sexStudent;
  int yearConclusionEducationMedicalStudent;
  int yearStartGraduationStudent;
  Course course;

  Enade(
      this.id,
      this.year,
      this.ageStudent,
      this.sexStudent,
      this.yearConclusionEducationMedicalStudent,
      this.yearStartGraduationStudent,
      this.course);
  Enade.empty();

  factory Enade.fromMap(Map json) {
    return Enade(
        json['id'],
        json['ano_enade'],
        json['idade'],
        json['sexo'],
        json['ano_conc_ens_medio'],
        json['ano_inic_grad'],
        Course.fromMap(json['id_curso']));
  }

  static List<Enade> toList(List list) {
    return list.map((e) => Enade.fromMap(e)).toList();
  }
}
