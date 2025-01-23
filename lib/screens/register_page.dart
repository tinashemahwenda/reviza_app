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
  final _phoneNumberController = TextEditingController();
  bool _isFormVisible = true;
  String _existingName = '';

  @override
  void initState() {
    super.initState();
    _isUserNameAvailable();
  }

  _isUserNameAvailable() async {
    final prefs = await SharedPreferences.getInstance();
    final existingName = prefs.getString('revizaUserName');

    if (existingName != null) {
      setState(() {
        _existingName = existingName;
        _isFormVisible = false;
      });
    }
  }

  _saveNameAndPhone() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('revizaName', _nameSurnameController.text);
    prefs.setString('revizaPhoneNumber', _phoneNumberController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Form(
            key: _formKey,
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
                      if (value!.isEmpty) {
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
                    if (_formKey.currentState!.validate()) {
                      _saveNameAndPhone();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
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
    );
  }
}
