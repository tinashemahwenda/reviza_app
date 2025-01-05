import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';

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
              Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Physics',
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
              )
            ],
          )),
        ));
  }
}
