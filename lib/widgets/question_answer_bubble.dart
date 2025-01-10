import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class QuestionAnswerBubble extends StatelessWidget {
  const QuestionAnswerBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppMeasure.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
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
    );
  }
}
