import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/widgets/back_button.dart';

class PersonalDetailsPage extends StatelessWidget {
  const PersonalDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              SettingsBackButton(pageName: 'Your Info'),
              SizedBox(height: 20),
              Container(
                width: AppMeasure.width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.dodgerBlue,
                      child: Text('T'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
