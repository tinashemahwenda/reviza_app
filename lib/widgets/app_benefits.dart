import 'package:flutter/material.dart';

class AppBenefits extends StatelessWidget {
  const AppBenefits({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(
          Icons.check,
          color: Colors.white,
          size: 20,
        ),
        Text(
          'Access to over +1000 solutions',
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
