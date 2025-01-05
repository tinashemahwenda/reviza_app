import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class QuestionsBubble extends StatelessWidget {
  final String questionBody;
  final int questionNumber;
  const QuestionsBubble(
      {super.key, required this.questionNumber, required this.questionBody});

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      color: AppColor.darkBlue,
                      child: Text(
                        '0625/33/M/J/23',
                        style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Manrope-Extrabold',
                          color: Colors.white,
                        ),
                      ),
                    ),
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
