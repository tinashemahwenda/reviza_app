import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reviza_app/widgets/go_back_button.dart';
import 'package:reviza_app/widgets/navigationbar.dart';
import 'package:reviza_app/widgets/subject_tile.dart';
import 'package:reviza_app/widgets/topic_modal_tile.dart';

import '../constants/app_constants.dart';
import '../widgets/banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              height: AppMeasure.height / 2,
              width: AppMeasure.width,
              color: AppColor.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                      Text(
                        'Select Topic',
                        style: TextStyle(
                          fontFamily: 'Manrope-Extrabold',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TopicModalTile(topicTitle: 'Motion, forces & energy'),
                      TopicModalTile(topicTitle: 'Waves'),
                      TopicModalTile(topicTitle: 'Thermal Physics'),
                      TopicModalTile(topicTitle: 'Electricity & Magnetism'),
                      TopicModalTile(topicTitle: 'Nuclear Physics'),
                      TopicModalTile(topicTitle: 'Space Physics')
                    ],
                  ),
                ),
              )),
        );
      },
    );
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
                  height: 40,
                ),
                RevizaNavigation(),
                SizedBox(
                  height: 40,
                ),
                RevizaBanner(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Subjects',
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
