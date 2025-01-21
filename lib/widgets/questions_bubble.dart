import 'package:flutter/material.dart';
import 'package:reviza_app/screens/saved_questions.dart';

import '../constants/app_constants.dart';
//import '../models/question.dart';

class QuestionsBubble extends StatefulWidget {
  final String questionBody;
  final int questionNumber;
  final String questionCode;
  final String paperCode;

  const QuestionsBubble({
    super.key,
    required this.questionNumber,
    required this.questionBody,
    required this.questionCode,
    required this.paperCode,
    //required this.data,
  });

  @override
  State<QuestionsBubble> createState() => _QuestionsBubbleState();
}

class _QuestionsBubbleState extends State<QuestionsBubble> {
  bool savedButton = false;

  void toggleButton() {
    if (savedButton == true) {
      savedButton = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.darkBlue,
        content: Text('Question ${widget.questionNumber} removed'),
        action: SnackBarAction(
          label: 'View',
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => SavedQuestions())),
        ),
      ));
    } else {
      savedButton = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.darkBlue,
        content: Text('Question ${widget.questionNumber} saved successfully'),
        action: SnackBarAction(
          label: 'View',
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => SavedQuestions())),
        ),
      ));
    }
    setState(() {});
  }

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
                    'Question ${widget.questionNumber.toString()}',
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
                            '${widget.paperCode}${widget.questionCode}',
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
                            toggleButton();
                          },
                          child: savedButton
                              ? Icon(
                                  Icons.bookmark,
                                  color: AppColor.darkBlue,
                                )
                              : Icon(
                                  Icons.bookmark_add_outlined,
                                  color: AppColor.darkBlue,
                                ))
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
                  widget.questionBody,
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
