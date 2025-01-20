import 'package:flutter/material.dart';
import 'package:reviza_app/screens/saved_questions.dart';

import '../constants/app_constants.dart';

class RevizaNavigation extends StatelessWidget {
  const RevizaNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/reviza-transparent-long.png',
          width: 100,
        ),
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => SavedQuestions())),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 30,
              ),
              color: AppColor.dodgerBlue,
            ),
          ),
        )
      ],
    );
  }
}
