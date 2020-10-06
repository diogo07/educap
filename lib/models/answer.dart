import 'package:flutter/material.dart';

class Answer {
  String option;
  int amount;
  Color color;

  Answer(this.option, this.amount);

  factory Answer.fromMap(Map json) {
    return Answer(
      json['opcao'],
      json['total'],
    );
  }

  static List<Answer> toList(List list) {
    return list.map((e) => Answer.fromMap(e)).toList();
  }
}
