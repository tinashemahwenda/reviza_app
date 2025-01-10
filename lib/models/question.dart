import 'dart:convert';

class Topic {
  final String topic;
  final String topicCode;
  final List<Question> questions;

  Topic({
    required this.topic,
    required this.topicCode,
    required this.questions,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      topic: json['topic'],
      topicCode: json['code'],
      questions: List<Question>.from(json['questions']
          .map((questionJson) => Question.fromJson(questionJson))),
    );
  }
}

class Question {
  final int id;
  final String questionCode;
  final String questionNumber;
  final String questionBody;

  Question({
    required this.id,
    required this.questionCode,
    required this.questionNumber,
    required this.questionBody,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      questionCode: json['question_code'],
      questionNumber: json['question_number'],
      questionBody: json['question_body'],
    );
  }
}

List<Topic> parseTopics(String jsonData) {
  final parsed = json.decode(jsonData).cast<Map<String, dynamic>>();
  return parsed.map<Topic>((json) => Topic.fromJson(json)).toList();
}
