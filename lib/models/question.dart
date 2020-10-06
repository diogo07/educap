class Question {
  String id;
  String description;

  Question(this.id, this.description);
  Question.empty();

  factory Question.fromMap(Map json) {
    return Question(
      json['codigo'],
      json['pergunta'],
    );
  }

  static List<Question> toList(List list) {
    return list.map((e) => Question.fromMap(e)).toList();
  }
}
