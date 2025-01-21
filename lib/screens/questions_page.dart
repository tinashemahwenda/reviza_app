import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/screens/saved_questions.dart';
import 'package:reviza_app/screens/solutions.dart';
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
  final ScrollController _scrollController = ScrollController();
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
                    FilterYearBubble(yearNumber: 'All', selectedBubble: true),
                    FilterYearBubble(yearNumber: '2024', selectedBubble: false),
                    FilterYearBubble(yearNumber: '2023', selectedBubble: false),
                    FilterYearBubble(yearNumber: '2022', selectedBubble: false),
                    FilterYearBubble(yearNumber: '2021', selectedBubble: false),
                    FilterYearBubble(yearNumber: '2020', selectedBubble: false),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SavedQuestions())),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.bookmark),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: AppMeasure.width,
                height: AppMeasure.height / 1.4,
                child: Scrollbar(
                  controller: _scrollController,
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
              ),
              SizedBox(
                height: 200,
              )
            ],
          )),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => SolutionsPage())),
          label: Text(
            'Solutions',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: AppColor.darkBlue,
          icon: Icon(
            Icons.edit_note_outlined,
            color: Colors.white,
          ),
        ));
  }
}
