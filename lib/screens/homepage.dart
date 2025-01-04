import 'package:flutter/material.dart';
import 'package:reviza_app/widgets/navigationbar.dart';

import '../constants/app_constants.dart';
import '../widgets/banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                RevizaNavigation(),
                SizedBox(
                  height: 40,
                ),
                RevizaBanner()
              ],
            ),
          ),
        ));
  }
}
