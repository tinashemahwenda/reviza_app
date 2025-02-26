import 'package:flutter/material.dart';

class AppVersion extends StatelessWidget {
  final String versionNumber;
  const AppVersion({super.key, required this.versionNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text('Reviza Cambridge App'),
        Text(versionNumber),
        Spacer(),
      ],
    );
  }
}
