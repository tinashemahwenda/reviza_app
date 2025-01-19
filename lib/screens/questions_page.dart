import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/widgets/filter_bubble.dart';
import 'package:reviza_app/widgets/questions_bubble.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CAMBRIDGE | IGCSE | O LEVEL | PHYSICS',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            widget.topic.topic,
                            style: TextStyle(
                              fontFamily: 'Manrope-Extrabold',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: AppMeasure.width / 1.2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilterYearBubble(yearNumber: '2024'),
                      FilterYearBubble(yearNumber: '2023'),
                      FilterYearBubble(yearNumber: '2022'),
                      FilterYearBubble(yearNumber: '2021'),
                      FilterYearBubble(yearNumber: '2020'),
                      FilterYearBubble(yearNumber: '2019'),
                      FilterYearBubble(yearNumber: '2018'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: AppMeasure.width,
                height: AppMeasure.height / 1.3,
                child: ListView.builder(
                    itemCount: widget.topic.questions.length,
                    itemBuilder: (context, index) => QuestionsBubble(
                          paperCode: widget.topic.topicCode,
                          questionCode:
                              widget.topic.questions[index].questionCode,
                          questionNumber: widget.topic.questions[index].id,
                          questionBody:
                              widget.topic.questions[index].questionBody,
                        )),
              ),
              SizedBox(
                height: 100,
              )
            ],
          )),
        ));
  }
}
