import 'package:educap/helpers/constants.dart';
import 'package:flutter/material.dart';

class CustomAnswer {
  int year;
  List<CustomData> data;

  CustomAnswer(this.year, this.data);

  factory CustomAnswer.fromMap(Map json) {
    return CustomAnswer(
      json['ano'],
      json['total'],
    );
  }

  static List<CustomAnswer> toList(List list) {
    List data_2014 = [];
    List data_2015 = [];
    List data_2016 = [];
    List data_2017 = [];
    List data_2018 = [];
    list.forEach((item) {
      if (item["ano"] == 2014) {
        data_2014.add(item);
      }

      if (item["ano"] == 2015) {
        data_2015.add(item);
      }

      if (item["ano"] == 2016) {
        data_2016.add(item);
      }

      if (item["ano"] == 2017) {
        data_2017.add(item);
      }

      if (item["ano"] == 2018) {
        data_2018.add(item);
      }
    });

    List<CustomAnswer> listCustomAnswer = List<CustomAnswer>();
    listCustomAnswer.add(CustomAnswer(2014, CustomData.toList(data_2014)));
    listCustomAnswer.add(CustomAnswer(2015, CustomData.toList(data_2015)));
    listCustomAnswer.add(CustomAnswer(2016, CustomData.toList(data_2016)));
    listCustomAnswer.add(CustomAnswer(2017, CustomData.toList(data_2017)));
    listCustomAnswer.add(CustomAnswer(2018, CustomData.toList(data_2018)));

    return listCustomAnswer;
  }
}

class CustomData {
  String option;
  int amount;
  Color color;

  CustomData(this.option, this.amount, this.color);

  factory CustomData.fromMap(Map json) {
    return CustomData(json['opcao'], json['total'], Constants.getColor(0));
  }

  static List<CustomData> toList(List list) {
    return list.map((e) => CustomData.fromMap(e)).toList();
  }
}
