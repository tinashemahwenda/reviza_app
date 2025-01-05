import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Lottie.asset('assets/images/animations/loading.json'),
            Text('Making Questions')
          ],
        ),
      ),
    );
  }
}
