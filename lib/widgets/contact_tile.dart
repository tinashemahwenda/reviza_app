import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String contactNumber;
  final IconData contactIcon;
  const ContactTile(
      {super.key, required this.contactNumber, required this.contactIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(Icons.call),
        Text('+263 773 423 888'),
      ],
    );
  }
}
