import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class SubjectTile extends StatelessWidget {
  final String subjectTitle;
  final String subjectCode;
  final String subjectIconPath;
  const SubjectTile({
    super.key,
    required this.subjectTitle,
    required this.subjectCode,
    required this.subjectIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: AppMeasure.width,
          height: AppMeasure.height / 7,
          color: Colors.white,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: AppColor.darkBlue,
                    child: Image.asset(
                      subjectIconPath,
                      width: 60,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    subjectTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope-Extrabold',
                        fontSize: 18),
                  ),
                  Text(
                    subjectCode,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Expanded(child: SizedBox()),
              Icon(Icons.arrow_forward_ios),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
