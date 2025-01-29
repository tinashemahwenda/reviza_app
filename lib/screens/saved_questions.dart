import 'package:flutter/material.dart';
import 'package:reviza_app/widgets/uploading_questions_screen.dart';

class SavedQuestions extends StatefulWidget {
  const SavedQuestions({super.key});

  @override
  State<SavedQuestions> createState() => _SavedQuestionsState();
}

class _SavedQuestionsState extends State<SavedQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UploadingQuestionsScreen(uploadType: 'saved questions'),
    );
  }
}
