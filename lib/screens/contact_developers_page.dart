import 'package:flutter/material.dart';

class ContactDevelopersPage extends StatelessWidget {
  const ContactDevelopersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back_ios),
              Text('Contact Developers'),
            ],
          )
        ],
      ),
    );
  }
}
