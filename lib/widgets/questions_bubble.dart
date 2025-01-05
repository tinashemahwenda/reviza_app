import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class QuestionsBubble extends StatelessWidget {
  const QuestionsBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(20),
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
                      fontFamily: 'Manrope-Extrabold',
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.blueAccent,
                      child: Text(
                        '0625/33/M/J/23',
                        style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Manrope-Extrabold',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '1 (a) A boat crosses a river. The boat points at right angles to the river bank and it travels at a speed of 3.5m/ s relative to the water.A river current acts at right angles to the direction the boat points. The river current has a speed of 2.5m/s.By drawing a scale diagram or by calculation, determine the speed and direction of the boat relative to the river bank',
                  style: TextStyle(
                    height: 2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
