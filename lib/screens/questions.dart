import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/widgets/questions_bubble.dart';
import 'package:reviza_app/widgets/questions_navbar.dart';

import '../models/question.dart';

class QuestionsPage extends StatefulWidget {
  final List<Topic> data;
  const QuestionsPage({super.key, required this.data});

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
                questionBody:
                    '1 (a) A boat crosses a river. The boat points at right angles to the river bank and it travels at a speed of 3.5m/ s relative to the water.A river current acts at right angles to the direction the boat points. The river current has a speed of 2.5m/s.By drawing a scale diagram or by calculation, determine the speed and direction of the boat relative to the river bank',
              ),
            ],
          )),
        ));
  }
}
