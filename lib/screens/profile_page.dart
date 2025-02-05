import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reviza_app/widgets/go_back_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/animations/loading.json', width: 200),
            SizedBox(height: 20),
            Text(
              'Still working on your',
              style: TextStyle(
                fontFamily: 'Manrope-Extrabold',
                fontSize: 20,
              ),
            ),
            GoBackButton()
          ],
        ),
      ),
    );
  }
}
