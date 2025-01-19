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
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilterYearBubble(yearNumber: 'All', selectedBubble: false),
                    FilterYearBubble(yearNumber: '2024', selectedBubble: false),
                    FilterYearBubble(yearNumber: '2023', selectedBubble: false),
                    FilterYearBubble(yearNumber: '2022', selectedBubble: false),
                    FilterYearBubble(yearNumber: '2021', selectedBubble: false),
                    FilterYearBubble(yearNumber: '2020', selectedBubble: false),
                    PopupMenuButton(
                        color: Colors.white,
                        menuPadding: EdgeInsets.all(20),
                        offset: Offset.zero,
                        child: Icon(Icons.filter_list),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context) => <PopupMenuEntry>[
                              PopupMenuItem(
                                child: Text('2019'),
                              ),
                              PopupMenuItem(child: Text('2018')),
                              PopupMenuItem(child: Text('2017')),
                              PopupMenuItem(child: Text('2016')),
                              PopupMenuItem(child: Text('2015')),
                              PopupMenuItem(child: Text('2014')),
                              PopupMenuItem(child: Text('2013')),
                              PopupMenuItem(child: Text('2012')),
                            ])
                  ],
                ),
              ),
              SizedBox(
                width: AppMeasure.width,
                height: AppMeasure.height / 1.3,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
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
