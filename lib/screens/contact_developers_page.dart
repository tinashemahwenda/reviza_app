import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/widgets/contact_tile.dart';

class ContactDevelopersPage extends StatelessWidget {
  const ContactDevelopersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios)),
                    Text(
                      'Contact Developers',
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
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      ContactTile(
                          contactNumber: '+263 773 423 888',
                          contactIcon: Icons.call),
                      ContactTile(
                          contactNumber: 'enquiries@reviza.co.zw',
                          contactIcon: Icons.email),
                      ContactTile(
                          contactNumber: 'sales@reviza.co.zw',
                          contactIcon: Icons.mail)
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: AppMeasure.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Direct Enquiry',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Write to us....',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColor.darkBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: AppMeasure.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Social Media',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Image.asset(
                            'assets/images/whatsapp.png',
                            width: 30,
                          ),
                          Text('Message through WhatsApp')
                        ],
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Image.asset(
                            'assets/images/facebook.png',
                            width: 30,
                          ),
                          Text('Visit our Facebook Page')
                        ],
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Image.asset(
                            'assets/images/twitter.png',
                            width: 30,
                          ),
                          Text('Visit our X(Twitter) Page')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
