import 'package:flutter/material.dart';
import 'package:reviza_app/widgets/uploading_questions_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question.dart';

class SavedQuestions extends StatefulWidget {
  final List<Question> allQuestions;
  const SavedQuestions({super.key, required this.allQuestions});

  @override
  State<SavedQuestions> createState() => _SavedQuestionsState();
}

class _SavedQuestionsState extends State<SavedQuestions> {
  Set<String> savedQuestions = {};

  Future<void> _loadSavedQuestions() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      savedQuestions = prefs.getStringList('savedQuestions')?.toSet() ?? {};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UploadingQuestionsScreen(uploadType: 'saved questions'),
    );
  }
}
