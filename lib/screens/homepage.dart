import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/reviza-transparent-long.png',
                      width: 60,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        color: AppColor.dodgerBlue,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
