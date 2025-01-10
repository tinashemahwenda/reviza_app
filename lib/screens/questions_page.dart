import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/widgets/questions_bubble.dart';
import 'package:reviza_app/widgets/questions_navbar.dart';

import '../models/question.dart';

class QuestionsPage extends StatefulWidget {
  final Topic topic;
  const QuestionsPage({super.key, required this.topic});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: RevizaQuestionsNav()),
              SizedBox(
                height: 30,
              ),
              QuestionsBubble(
                questionNumber: 1,
                questionBody: widget.topic.questions[0].questionBody,
              ),
            ],
          )),
        ));
  }
}
