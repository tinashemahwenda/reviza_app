import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/widgets/go_back_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Row(
            spacing: 20,
            children: [
              Icon(Icons.arrow_back_ios),
              Text(
                'Your Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        )));
  }
}
