import 'package:flutter/material.dart';
import 'package:reviza_app/screens/saved_questions.dart';
import 'package:reviza_app/screens/solutions.dart';
import 'package:reviza_app/screens/upgrade_account.dart';

import '../constants/app_constants.dart';
//import '../models/question.dart';

class QuestionsBubble extends StatefulWidget {
  final String questionBody;
  final int questionNumber;
  final String questionCode;
  final String paperCode;
  final bool isSaved;
  final VoidCallback onSavePressed;

  const QuestionsBubble({
    super.key,
    required this.questionNumber,
    required this.questionBody,
    required this.questionCode,
    required this.paperCode,
    required this.isSaved,
    required this.onSavePressed,
    //required this.data,
  });

  @override
  State<QuestionsBubble> createState() => _QuestionsBubbleState();
}

class _QuestionsBubbleState extends State<QuestionsBubble> {
  bool savedButton = false;

  void toggleButton() {
    setState(() {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
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
                      fontSize: 18,
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpgradeAccount())),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            color: AppColor.darkBlue,
                            child: Text(
                              'Solution',
                              style: TextStyle(
                                fontSize: 8,
                                fontFamily: 'Manrope-Extrabold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          //padding: EdgeInsets.all(0),
                          onTap: widget.onSavePressed,
                          child: Icon(
                              widget.isSaved
                                  ? Icons.bookmark
                                  : Icons.bookmark_add_outlined,
                              color: AppColor.darkBlue)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              /*ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: AppMeasure.width,
                  height: AppMeasure.height / 4,
                  color: AppColor.darkBlue,
                  child: Image.asset(
                    'assets/images/chemistry.png',
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SelectableText(
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
