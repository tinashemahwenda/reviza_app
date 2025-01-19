import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class FilterYearBubble extends StatelessWidget {
  final String yearNumber;
  const FilterYearBubble({super.key, required this.yearNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 2,
          ),
          color: AppColor.darkBlue.withAlpha(30),
          child: Text(
            yearNumber,
            style: TextStyle(
                color: AppColor.darkBlue.withAlpha(100),
                fontSize: 11,
                fontWeight: FontWeight.bold,
                fontFamily: 'Manrope-ExtraBold'),
          ),
        ),
      ),
    );
  }
}
