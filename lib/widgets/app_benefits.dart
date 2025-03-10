import 'package:flutter/material.dart';

class AppBenefits extends StatelessWidget {
  final String appBenefit;
  const AppBenefits({super.key, required this.appBenefit});

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
          appBenefit,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
