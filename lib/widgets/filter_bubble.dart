import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class FilterYearBubble extends StatelessWidget {
  final String yearNumber;
  final bool selectedBubble;
  const FilterYearBubble(
      {super.key, required this.yearNumber, required this.selectedBubble});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 2,
          ),
          color: selectedBubble
              ? AppColor.darkBlue.withAlpha(255)
              : AppColor.darkBlue.withAlpha(30),
          child: Text(
            yearNumber,
            style: TextStyle(
                color: selectedBubble
                    ? Colors.white
                    : AppColor.darkBlue.withAlpha(50),
                fontSize: 11,
                fontWeight: FontWeight.bold,
                fontFamily: 'Manrope-ExtraBold'),
          ),
        ),
      ),
    );
  }
}
