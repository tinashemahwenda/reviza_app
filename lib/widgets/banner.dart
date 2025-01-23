import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class RevizaBanner extends StatefulWidget {
  final String studentName;
  const RevizaBanner({super.key, required this.studentName});

  @override
  State<RevizaBanner> createState() => _RevizaBannerState();
}

class _RevizaBannerState extends State<RevizaBanner> {
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
                    width: AppMeasure.width / 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Hi, ${widget.studentName}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Be an A* \nStudent!',
                          style: TextStyle(
                            fontFamily: 'Manrope-Extrabold',
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.white,
                            height: 0,
                          ),
                        ),
                      ],
                    )),
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
