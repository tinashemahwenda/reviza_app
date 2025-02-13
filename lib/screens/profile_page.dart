import 'package:flutter/material.dart';
//import 'package:lottie/lottie.dart';
import 'package:reviza_app/constants/app_constants.dart';
//import 'package:reviza_app/widgets/go_back_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    bool value = true;
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  children: [
                    Row(
                      spacing: 20,
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Text(
                          'Your Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: AppMeasure.width,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        spacing: 20,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColor.dodgerBlue,
                            child: Text(
                              'T',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tinashe',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Student',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: AppMeasure.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Turn on notifications',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Switch(
                                  value: value,
                                  activeColor: AppColor.dodgerBlue,
                                  thumbColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      value = !newValue;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
