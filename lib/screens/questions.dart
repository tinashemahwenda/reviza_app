import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/widgets/questions_bubble.dart';
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
              QuestionsBubble(
                questionNumber: 1,
                questionBody:
                    '1 (a) A boat crosses a river. The boat points at right angles to the river bank and it travels at a speed of 3.5m/ s relative to the water.A river current acts at right angles to the direction the boat points. The river current has a speed of 2.5m/s.By drawing a scale diagram or by calculation, determine the speed and direction of the boat relative to the river bank',
              ),
              QuestionsBubble(
                questionNumber: 2,
                questionBody:
                    '1(b) Speed is a scalar quantity and velocity is a vector quantity.State the names of one other scalar quantity and one other vector quantity',
              ),
              QuestionsBubble(
                questionNumber: 3,
                questionBody:
                    '3 (a) State the principle of conservation of energy.',
              ),
              QuestionsBubble(
                questionNumber: 4,
                questionBody:
                    '3 (a) State the principle of conservation of energy.',
              ),
              QuestionsBubble(
                questionNumber: 5,
                questionBody:
                    'b) A wind turbine has a maximum output power of 1.8MW. The turbine operates at maximum power for 4.0h.\n(i) Define the unit kWh.\n(ii) Calculate the energy produced by the wind turbine operating at maximum power for 4.0h. Give your answer in kWh.',
              ),
            ],
          )),
        ));
  }
}
