import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/widgets/questions_bubble.dart';

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

  @override
  void initState() {
    super.initState();
    filteredQuestions = widget.topic.questions;
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
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 30),
                child: Wrap(
                  spacing: 10,
                  children: [
                    FilterChip(
                      label: Text(
                        'All',
                      ),
                      selected: selectedFilter == 'All',
                      onSelected: (_) => filterQuestions('All'),
                    ),
                    ...years.map((year) {
                      return FilterChip(
                        label: Text('20$year'),
                        selected: selectedFilter == year,
                        onSelected: (_) => filterQuestions(year),
                      );
                    }).toList()
                  ],
                )),
            SizedBox(
              width: AppMeasure.width,
              height: AppMeasure.height / 1.4,
              child: Scrollbar(
                radius: Radius.circular(10),
                controller: _scrollController,
                scrollbarOrientation: ScrollbarOrientation.left,
                thumbVisibility: true,
                interactive: true,
                child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: filteredQuestions.length,
                    itemBuilder: (context, index) {
                      final question = filteredQuestions[index];
                      QuestionsBubble(
                        paperCode: widget.topic.topicCode,
                        questionCode: question.questionCode,
                        questionNumber: question.id,
                        questionBody: question.questionBody,
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 200,
            )
          ],
        )),
      ),
      /*floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => SolutionsPage())),
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
        )*/
    );
  }
}
