import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/widgets/blue_button.dart';

class UpgradeAccount extends StatelessWidget {
  const UpgradeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    onDoubleTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.cancel_outlined,
                      color: const Color.fromARGB(119, 158, 158, 158),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Image.asset('assets/images/reviza-icon.png', width: 100),
              SizedBox(height: 20),
              Text(
                'Upgrade to Premium+',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Column(
                spacing: 10,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        'Access to over +1000 solutions',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        'Unlock all features',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        'Covers 3 Apps in one Purchase',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Spacer(),
              Row(
                spacing: 10,
                children: [
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        )),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Text('Forever'),
                        Text(
                          '\$9.99',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Life Time',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        )),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Text('Monthly'),
                        Text(
                          '\$4.99',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'per month',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer()
                ],
              ),
              Spacer(),
              Text(
                'Payments done using Ecocash or Innbucks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                  onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => Container(
                            width: AppMeasure.width,
                            height: AppMeasure.height / 3,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Choose your payment method',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text('Ecocash -  \$9.99'),
                                ),
                                Divider(),
                                InkWell(
                                  onTap: () => showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                            insetPadding: EdgeInsets.all(100),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              height: AppMeasure.height / 5,
                                              width: AppMeasure.width,
                                              padding: EdgeInsets.all(20),
                                              child: Column(
                                                spacing: 20,
                                                children: [
                                                  SizedBox(height: 10),
                                                  CircularProgressIndicator(),
                                                  Text('Processing Payment')
                                                ],
                                              ),
                                            ),
                                          )),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text('InnBucks - \$9.99'),
                                  ),
                                ),
                              ],
                            ),
                          )),
                  child: BlueButton(buttonText: 'Confirm Upgrade'))
            ],
          ),
        ),
      ),
    );
  }
}
