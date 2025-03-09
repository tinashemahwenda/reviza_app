import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class PackageBox extends StatelessWidget {
  final Color selectedColor;
  const PackageBox({super.key, required this.selectedColor});

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
            'Forever',
            style: TextStyle(
              color: AppColor.dodgerBlue,
            ),
          ),
          Text(
            '\$9.99',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          Text(
            'Life Time',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
