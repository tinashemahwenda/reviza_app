import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameSurnameController = TextEditingController();
  final _schoolNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _nameSurnameController.dispose();
    _phoneNumberController.dispose();
    _schoolNameController.dispose();
    super.dispose();
  }

  Future<void> _saveData() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', _nameSurnameController.text);
      await prefs.setString('schoolName', _schoolNameController.text);
      await prefs.setString('phoneNumber', _phoneNumberController.text);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Saved successfully')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
                child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/reviza-transparent-long.png',
                    width: 200,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text('Register new account'),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _nameSurnameController,
                    decoration: InputDecoration(
                      focusColor: AppColor.darkBlue,
                      fillColor: AppColor.darkBlue,
                      hoverColor: AppColor.darkBlue,
                      label: Text(
                        'Full Name',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _schoolNameController,
                    decoration: InputDecoration(
                      focusColor: AppColor.darkBlue,
                      fillColor: AppColor.darkBlue,
                      hoverColor: AppColor.darkBlue,
                      label: Text(
                        'School Name',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your school name';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      focusColor: AppColor.darkBlue,
                      fillColor: AppColor.darkBlue,
                      hoverColor: AppColor.darkBlue,
                      label: Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    _saveData;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.darkBlue),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ));
  }
}
