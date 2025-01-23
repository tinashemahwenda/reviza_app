import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:reviza_app/screens/homepage.dart';
import 'package:reviza_app/screens/register_page.dart';
import 'constants/app_constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(255, 242, 243, 244),
  ));
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
        home: Scaffold(
          backgroundColor: Colors.white,
          body: RegisterPage(),
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Manrope-Regular'),
      );
    });
  }
}
