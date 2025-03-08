import 'package:flutter/material.dart';
import 'package:reviza_app/screens/profile_page.dart';
import 'package:reviza_app/screens/upgrade_account.dart';
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
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UpgradeAccount())),
              child: CircleAvatar(
                backgroundColor: Colors.transparent, //AppColor.dodgerBlue,
                radius: 24,
                child: Icon(
                  Icons.diamond,
                  color: AppColor.dodgerBlue,
                ),
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
