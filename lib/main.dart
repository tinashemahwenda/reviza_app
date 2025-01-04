import 'package:flutter/material.dart';
import 'package:reviza_app/screens/homepage.dart';

import 'constants/app_constants.dart';

void main() {
  runApp(RevizaApp());
}

class RevizaApp extends StatelessWidget {
  const RevizaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      AppMeasure.width = MediaQuery.of(context).size.width;
      AppMeasure.height = MediaQuery.of(context).size.height;
      AppColor.backgroundColor = Color.fromARGB(255, 242, 243, 244);
      AppColor.darkBlue = Color.fromARGB(255, 17, 24, 28);
      AppColor.dodgerBlue = Color.fromARGB(255, 0, 127, 255);
      return MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Manrope-Regular'),
      );
    });
  }
}
