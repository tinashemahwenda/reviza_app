import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class PackageBox extends StatelessWidget {
  final Color selectedColor;
  final String packageName;
  final String packagePrice;
  final String packageLength;
  const PackageBox({
    super.key,
    required this.selectedColor,
    required this.packageName,
    required this.packagePrice,
    required this.packageLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: selectedColor,
          )),
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            packageLength,
            style: TextStyle(
              color: AppColor.dodgerBlue,
            ),
          ),
          Text(
            packagePrice,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          Text(
            packageLength,
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
