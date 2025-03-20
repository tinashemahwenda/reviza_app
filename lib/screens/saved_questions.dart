import 'package:flutter/material.dart';
import 'package:reviza_app/widgets/questions_bubble.dart';

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

  @override
  void initState() {
    super.initState();
    _loadSavedQuestions();
  }

  Future<void> _loadSavedQuestions() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      savedQuestions = prefs.getStringList('savedQuestions')?.toSet() ?? {};
    });
  }

  Future<void> _toggleSavedQuestion(String questionId, String topic) async {
    final prefs = await SharedPreferences.getInstance();
    final String key = '$questionId-$topic';

    setState(() {
      savedQuestions.remove(key);
      prefs.setStringList('savedQuestion', savedQuestions.toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Question> displayedQuestions = widget.allQuestions
        .where((q) => savedQuestions.contains('${q.questionCode}-${q.id}'))
        .toList();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: displayedQuestions.isEmpty
                ? Center(
                    child: Text('Not saved Questions'),
                  )
                : ListView.builder(
                    itemCount: displayedQuestions.length,
                    itemBuilder: (context, index) {
                      final question = displayedQuestions[index];

                      return QuestionsBubble(
                          questionNumber: question.id,
                          questionBody: question.questionBody,
                          questionCode: question.questionCode,
                          paperCode: question.questionCode,
                          isSaved: true,
                          onSavePressed: () => _toggleSavedQuestion(
                              question.id.toString(), question.questionCode));
                    }),
          ),
        ));
  }
}
