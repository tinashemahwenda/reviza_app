import 'package:flutter/material.dart';

import '../screens/saved_questions.dart';

class SavedQuestionsButton extends StatelessWidget {
  const SavedQuestionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SavedQuestions())),
      child: Icon(Icons.bookmark, size: 30),
    );
  }
}
