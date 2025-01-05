import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/widgets/questions_navbar.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: RevizaQuestionsNav()),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: AppMeasure.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Question 1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Manrope-Extrabold'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text('0625/33/M/J/23'),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
        ));
  }
}
