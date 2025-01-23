import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:typewritertext/typewritertext.dart';

import '../constants/app_constants.dart';

class RevizaBanner extends StatefulWidget {
  const RevizaBanner({super.key});

  @override
  State<RevizaBanner> createState() => _RevizaBannerState();
}

class _RevizaBannerState extends State<RevizaBanner> {
  String _name = 'Bull';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('revizaUserName');

    setState(() {
      _name = name!;
    });
  }

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
                  child: TypeWriter.text(
                    '$_name, be an A* Student!',
                    duration: Duration(milliseconds: 100),
                    repeat: false,
                    style: TextStyle(
                      fontFamily: 'Manrope-Extrabold',
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
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
