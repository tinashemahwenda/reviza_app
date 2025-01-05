import 'package:flutter/material.dart';
import 'package:reviza_app/widgets/navigationbar.dart';
import 'package:reviza_app/widgets/subject_tile.dart';

import '../constants/app_constants.dart';
import '../widgets/banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text('Select Topic')
                ],
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
                SubjectTile(
                  subjectTitle: 'Biology',
                  subjectCode: '0610',
                  subjectIconPath: 'assets/images/biology.png',
                ),
                SubjectTile(
                  subjectTitle: 'Mathematics',
                  subjectCode: '0580',
                  subjectIconPath: 'assets/images/maths.png',
                ),
                SubjectTile(
                  subjectTitle: 'Chemistry',
                  subjectCode: '0620',
                  subjectIconPath: 'assets/images/chemistry.png',
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
