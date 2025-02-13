import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String settingName;
  final IconData iconName;
  const SettingsTile(
      {super.key, required this.settingName, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        spacing: 20,
        children: [
          Icon(iconName),
          Text(
            settingName,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ],
      ),
    );
  }
}
