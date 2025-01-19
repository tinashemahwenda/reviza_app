import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class FilterYearBubble extends StatelessWidget {
  const FilterYearBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 4,
          ),
          color: AppColor.darkBlue,
          child: Text(
            '2022',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
