import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/screens/saved_questions.dart';
import 'package:reviza_app/widgets/questions_bubble.dart';
import 'package:reviza_app/widgets/saved_questions_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/question.dart';

class QuestionsPage extends StatefulWidget {
  final Topic topic;
  const QuestionsPage({super.key, required this.topic});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final ScrollController _scrollController = ScrollController();
  String selectedFilter = 'All';
  List<Question> filteredQuestions = [];
  Set<String> savedQuestions = {};

  @override
  void initState() {
    super.initState();
    filteredQuestions = widget.topic.questions;
    _loadSavedQuestions();
  }

  Future<void> _loadSavedQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedQuestions = prefs.getStringList('savedQuestions')?.toSet() ?? {};
    });
  }

  Future<void> _toggleSaveQuestion(String questionId, String topic) async {
    final prefs = await SharedPreferences.getInstance();
    final String key = '$topic-$questionId';

    setState(() {
      if (savedQuestions.contains(key)) {
        savedQuestions.remove(key);
      } else {
        savedQuestions.add(key);
      }
      prefs.setStringList('savedQuestions', savedQuestions.toList());
    });
  }

  void filterQuestions(String year) {
    if (year == 'All') {
      setState(() {
        filteredQuestions = widget.topic.questions;
        selectedFilter = 'All';
      });
    } else {
      setState(() {
        filteredQuestions = widget.topic.questions
            .where((question) => question.questionCode.endsWith(year))
            .toList();
        selectedFilter = year;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final years = widget.topic.questions
        .map((q) => q.questionCode.substring(q.questionCode.length - 2))
        .toSet()
        .toList()
      ..sort();

    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CAMBRIDGE | IGCSE | O LEVEL | PHYSICS',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            widget.topic.topic,
                            style: TextStyle(
                              fontFamily: 'Manrope-Extrabold',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      SavedQuestionsButton()
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 20),
                  child: Wrap(
                    spacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      FilterChip(
                        label: Text(
                          'All',
                          style: TextStyle(
                            fontSize: 11,
                            color: selectedFilter == 'All'
                                ? Colors.white
                                : AppColor.darkBlue,
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        selected: selectedFilter == 'All',
                        onSelected: (_) => filterQuestions('All'),
                        showCheckmark: false,
                        selectedColor: AppColor.darkBlue,
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      ...years.map((year) {
                        return FilterChip(
                          label: Text(
                            '20$year',
                            style: TextStyle(
                              fontSize: 11,
                              color: selectedFilter == year
                                  ? Colors.white
                                  : AppColor.darkBlue,
                            ),
                          ),
                          selected: selectedFilter == year,
                          onSelected: (_) => filterQuestions(year),
                          selectedColor: AppColor.darkBlue,
                          showCheckmark: false,
                          backgroundColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        );
                      }).toList(),
                    ],
                  )),
              SizedBox(
                width: AppMeasure.width,
                height: AppMeasure.height / 1.4,
                child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: filteredQuestions.length,
                    itemBuilder: (context, index) {
                      final question = filteredQuestions[index];
                      final String uniqueKey =
                          '${widget.topic.topic}-${question.id}';
                      return QuestionsBubble(
                        paperCode: widget.topic.topicCode,
                        questionCode: question.questionCode,
                        questionNumber: question.id,
                        questionBody: question.questionBody,
                        isSaved: savedQuestions.contains(uniqueKey),
                        onSavePressed: () => _toggleSaveQuestion(
                            question.id.toString(), widget.topic.topic),
                      );
                    }),
              ),
              SizedBox(
                height: 200,
              )
            ],
          )),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => SavedQuestions())),
          label: Text(
            'Solutions',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: AppColor.darkBlue,
          icon: Icon(
            Icons.edit_note_outlined,
            color: Colors.white,
          ),
        ));
  }
}
