import 'package:flutter/material.dart';
import 'package:reviza_app/screens/register_page.dart';
import 'package:reviza_app/screens/saved_questions.dart';

import '../constants/app_constants.dart';

class RevizaNavigation extends StatelessWidget {
  final String nameInitials;
  const RevizaNavigation({super.key, required this.nameInitials});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage())),
          child: Image.asset(
            'assets/images/reviza-transparent-long.png',
            width: 100,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => SavedQuestions())),
          child: CircleAvatar(
            backgroundColor: AppColor.dodgerBlue,
            radius: 24,
            child: Text(
              nameInitials[0],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
