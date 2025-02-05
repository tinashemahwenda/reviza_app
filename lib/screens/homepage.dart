import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:reviza_app/screens/questions_page.dart';
import 'package:reviza_app/widgets/go_back_button.dart';
import 'package:reviza_app/widgets/navigationbar.dart';
import 'package:reviza_app/widgets/subject_tile.dart';
import 'package:reviza_app/widgets/topic_modal_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';
import '../models/question.dart';
import '../widgets/banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _name = '';
  List<Topic> _topics = [];

  @override
  void initState() {
    super.initState();
    _loadJsonData();
    _loadProfileData();
  }

  Future<void> _loadJsonData() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/data/questions.json');

      List<dynamic> jsonData = jsonDecode(jsonString);

      List<Topic> topics =
          jsonData.map((data) => Topic.fromJson(data)).toList();

      setState(() {
        _topics = topics;
      });
    } catch (e) {
      _topics == e;
    }
  }

  void showLoading() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              height: AppMeasure.height / 2,
              width: AppMeasure.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Lottie.asset('assets/images/animations/loading.json',
                        width: 250),
                    Text(
                      'Still making topics',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'Manrope-Extrabold'),
                    ),
                    GoBackButton()
                  ],
                ),
              ),
            ),
          );
        });
  }

  void show() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
              height: AppMeasure.height * 2,
              width: AppMeasure.width,
              color: AppColor.backgroundColor,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Spacer(),
                            GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Icon(Icons.cancel_outlined)),
                          ],
                        ),
                        Text(
                          'Select Topic',
                          style: TextStyle(
                            fontFamily: 'Manrope-Extrabold',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: AppMeasure.height,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: _topics.length,
                            itemBuilder: (context, index) {
                              final topic = _topics[index];
                              return GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuestionsPage(topic: topic))),
                                  child: TopicModalTile(
                                    topicTitle: topic.topic,
                                    questionNumbers: topic.questions.length,
                                  ));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ))),
        );
      },
    );
  }

  _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');

    setState(() {
      _name = name!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                RevizaNavigation(),
                SizedBox(
                  height: 30,
                ),
                RevizaBanner(
                    studentName: _name.isNotEmpty ? _name : 'Loading...'),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'IGCSE Subjects',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope-Extrabold',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: show,
                  child: SubjectTile(
                    subjectTitle: 'Physics',
                    subjectCode: '0625',
                    subjectIconPath: 'assets/images/physics.png',
                  ),
                ),
                GestureDetector(
                  onTap: showLoading,
                  child: SubjectTile(
                    subjectTitle: 'Biology',
                    subjectCode: '0610',
                    subjectIconPath: 'assets/images/biology.png',
                  ),
                ),
                GestureDetector(
                  onTap: showLoading,
                  child: SubjectTile(
                    subjectTitle: 'Mathematics',
                    subjectCode: '0580',
                    subjectIconPath: 'assets/images/maths.png',
                  ),
                ),
                GestureDetector(
                  onTap: showLoading,
                  child: SubjectTile(
                    subjectTitle: 'Chemistry',
                    subjectCode: '0620',
                    subjectIconPath: 'assets/images/chemistry.png',
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}
