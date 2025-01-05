import 'package:flutter/material.dart';

class RevizaQuestionsNav extends StatelessWidget {
  const RevizaQuestionsNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              'Motion, forces & energy',
              style: TextStyle(
                fontFamily: 'Manrope-Extrabold',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        )
      ],
    );
  }
}
