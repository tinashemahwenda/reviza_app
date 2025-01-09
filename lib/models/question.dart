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
      questions: List<Question>.from(json['questions'].map((questionJson)=> Question.fromJson(questionJson))),
    );
  }
}

class Question {
  final 
}