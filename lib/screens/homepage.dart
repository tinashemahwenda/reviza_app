import 'package:flutter/material.dart';
import 'package:reviza_app/widgets/navigationbar.dart';
import 'package:reviza_app/widgets/subject_tile.dart';

import '../constants/app_constants.dart';
import '../widgets/banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                SubjectTile(
                  subjectTitle: 'Physics',
                ),
                SubjectTile(
                  subjectTitle: 'Biology',
                ),
                SubjectTile(
                  subjectTitle: 'Mathematics',
                ),
                SubjectTile(
                  subjectTitle: 'Chemistry',
                ),
              ],
            ),
          ),
        ));
  }
}
