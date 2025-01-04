import 'package:flutter/material.dart';
import 'package:reviza_app/screens/homepage.dart';

void main() {
  runApp(RevizaApp());
}

class RevizaApp extends StatelessWidget {
  const RevizaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
