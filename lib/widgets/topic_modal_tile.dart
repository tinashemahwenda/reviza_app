import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class TopicModalTile extends StatelessWidget {
  final String topicTitle;
  const TopicModalTile({super.key, required this.topicTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            width: AppMeasure.width,
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Center(child: Text(topicTitle))),
      ),
    );
  }
}
