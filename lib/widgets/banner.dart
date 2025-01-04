import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class RevizaBanner extends StatelessWidget {
  const RevizaBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
        Container(
          width: AppMeasure.width,
          height: AppMeasure.height / 4,
          color: AppColor.darkBlue,
          //padding: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: AppMeasure.width / 3,
                  child: Text(
                    'Be an A* Student!',
                    style: TextStyle(
                      fontFamily: 'Manrope-Extrabold',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(child: SizedBox())
              ],
            ),
          ),
        ),
        Image.asset(
          'assets/images/reviza-faint-icon.png',
          width: 200,
        ),
      ]),
    );
  }
}
