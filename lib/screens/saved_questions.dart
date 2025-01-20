import 'package:flutter/material.dart';
import 'package:reviza_app/widgets/uploading_questions_screen.dart';

class SavedQuestions extends StatelessWidget {
  const SavedQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UploadingQuestionsScreen(uploadType: 'saved questions'),
    );
  }
}
