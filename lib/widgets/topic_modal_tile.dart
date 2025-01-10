import 'package:flutter/material.dart';
import 'package:reviza_app/screens/questions.dart';

import '../constants/app_constants.dart';

class TopicModalTile extends StatelessWidget {
  final String topicTitle;
  const TopicModalTile({super.key, required this.topicTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => QuestionsPage())),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              width: AppMeasure.width,
              padding: EdgeInsets.all(18),
              color: Colors.white,
              child: Center(child: Text(topicTitle))),
        ),
      ),
    );
  }
}
