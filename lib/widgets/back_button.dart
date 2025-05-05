import 'package:flutter/material.dart';

class SettingsBackButton extends StatelessWidget {
  final String pageName;
  const SettingsBackButton({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Row(
        spacing: 20,
        children: [
          Icon(Icons.arrow_back_ios),
          Text(
            pageName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
