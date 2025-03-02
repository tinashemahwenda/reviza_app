import 'package:flutter/material.dart';
import 'package:reviza_app/screens/upgrade_account.dart';

class SavedQuestionsButton extends StatelessWidget {
  const SavedQuestionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => UpgradeAccount())),
      child: Icon(Icons.bookmark, size: 30),
    );
  }
}
