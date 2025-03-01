import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class BlueButton extends StatelessWidget {
  final String buttonText;
  const BlueButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppMeasure.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColor.dodgerBlue, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
