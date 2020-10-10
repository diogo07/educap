import 'package:educap/helpers/constants.dart';
import 'package:flutter/material.dart';

class Answer {
  String option;
  int amount;
  Color color;

  Answer(this.option, this.amount);

  factory Answer.fromMap(Map json) {
    return Answer(
      limitLenghtText(Constants.getDescriptionQuestion(
          json['codigo_questao'], json['opcao'])),
      json['total'],
    );
  }

  static String limitLenghtText(String text) {
    if (text.length > 15) {
      text = text.substring(0, 14) + "...";
    }
    return text;
  }

  static List<Answer> toList(List list) {
    return list.map((e) => Answer.fromMap(e)).toList();
  }
}
