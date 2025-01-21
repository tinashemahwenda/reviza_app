import 'package:flutter/material.dart';
import 'package:reviza_app/screens/saved_questions.dart';

import '../constants/app_constants.dart';
//import '../models/question.dart';

class QuestionsBubble extends StatelessWidget {
  final String questionBody;
  final int questionNumber;
  final String questionCode;
  final String paperCode;
  final bool toggleButton = false;
  //final List<Topic> data;
  const QuestionsBubble({
    super.key,
    required this.questionNumber,
    required this.questionBody,
    required this.questionCode,
    required this.paperCode,
    //required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(20),
          width: AppMeasure.width,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${questionNumber.toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope-Extrabold',
                    ),
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: AppColor.darkBlue,
                          child: Text(
                            '$paperCode$questionCode',
                            style: TextStyle(
                              fontSize: 8,
                              fontFamily: 'Manrope-Extrabold',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColor.darkBlue,
                            content: Text(
                                'Question $questionNumber saved successfully'),
                            action: SnackBarAction(
                              label: 'View',
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SavedQuestions())),
                            ),
                          ));
                        },
                        child: Icon(
                          Icons.bookmark_add_outlined,
                          color: AppColor.darkBlue,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  questionBody,
                  style: TextStyle(
                    height: 2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
