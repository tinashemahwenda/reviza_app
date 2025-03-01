import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../screens/personal_details_page.dart';

class ProfileTile extends StatelessWidget {
  final String fullName;
  final String initialName;
  const ProfileTile(
      {super.key, required this.initialName, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => PersonalDetailsPage())),
      child: Container(
        width: AppMeasure.width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          spacing: 20,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.dodgerBlue,
              child: Text(
                initialName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Student Account',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
