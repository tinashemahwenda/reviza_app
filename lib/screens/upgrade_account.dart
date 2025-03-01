import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';

class UpgradeAccount extends StatelessWidget {
  const UpgradeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                ],
              ),
              Image.asset('assets/images/reviza-icon.png', width: 100)
            ],
          ),
        ),
      ),
    );
  }
}
