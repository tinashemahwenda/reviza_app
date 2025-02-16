import 'package:flutter/material.dart';

class ContactDevelopersPage extends StatelessWidget {
  const ContactDevelopersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            children: [
              Row(
                spacing: 10,
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text('Contact Developers'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
