import 'package:flutter/material.dart';
import 'package:reviza_app/screens/profile_page.dart';
import '../constants/app_constants.dart';

class RevizaNavigation extends StatelessWidget {
  final String nameInitials;
  const RevizaNavigation({super.key, required this.nameInitials});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/reviza-transparent-long.png',
          width: 100,
        ),
        Row(
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.dodgerBlue,
              radius: 24,
              child: Icon(
                Icons.diamond,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage())),
              child: CircleAvatar(
                backgroundColor: AppColor.dodgerBlue,
                radius: 24,
                child: Text(
                  nameInitials[0].toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
