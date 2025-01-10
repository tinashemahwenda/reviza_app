import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
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
                height: 30,
              ),
              Container(
                width: AppMeasure.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: AppMeasure.width / 2.5,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppColor.darkBlue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Questions',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Answers',
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: AppMeasure.width,
                height: AppMeasure.height,
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
            ],
          )),
        ));
  }
}
