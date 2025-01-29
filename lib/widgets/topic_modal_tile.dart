import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
//import '../models/question.dart';

class TopicModalTile extends StatelessWidget {
  final String topicTitle;
  final int questionNumbers;

  const TopicModalTile(
      {super.key, required this.topicTitle, required this.questionNumbers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            width: AppMeasure.width,
            padding: EdgeInsets.all(18),
            color: Colors.white,
            child: Center(
              child: Row(
                spacing: 5,
                children: [
                  Spacer(),
                  Text(topicTitle),
                  Badge(
                    label: Text(questionNumbers.toString()),
                    backgroundColor: AppColor.darkBlue,
                  ),
                  Spacer()
                ],
              ),
            )),
      ),
    );
  }
}
