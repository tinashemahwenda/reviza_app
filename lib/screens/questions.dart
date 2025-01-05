import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/animations/loading.json', width: 200),
            SizedBox(height: 20),
            Text(
              'Making Questions',
              style: TextStyle(
                fontFamily: 'Manrope-Extrabold',
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
