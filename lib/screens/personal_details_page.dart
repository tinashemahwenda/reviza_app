import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/widgets/back_button.dart';
import 'package:reviza_app/widgets/blue_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  String _name = '';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');

    setState(() {
      _name = name!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              SettingsBackButton(pageName: 'Your Info'),
              SizedBox(height: 40),
              Container(
                width: AppMeasure.width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColor.dodgerBlue,
                      radius: AppMeasure.width / 6,
                      child: Text(
                        'T',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 15,
                        ),
                        Text('You can edit your name and number'),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tinashe',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '0773423888',
                      ),
                    ),
                    BlueButton(buttonText: 'Save Changes')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
