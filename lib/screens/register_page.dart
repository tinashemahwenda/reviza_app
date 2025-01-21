import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
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
                  decoration: InputDecoration(
                    focusColor: AppColor.darkBlue,
                    fillColor: AppColor.darkBlue,
                    hoverColor: AppColor.darkBlue,
                    label: Text(
                      'Enter your Full Name',
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
            ],
          )),
        ));
  }
}
