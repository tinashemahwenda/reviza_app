import 'package:flutter/material.dart';
import 'package:reviza_app/constants/app_constants.dart';
import 'package:reviza_app/screens/contact_developers_page.dart';

import 'package:reviza_app/screens/upgrade_account.dart';
import 'package:reviza_app/services/noti_service.dart';
import 'package:reviza_app/widgets/app_version.dart';
import 'package:reviza_app/widgets/back_button.dart';
import 'package:reviza_app/widgets/profile_tile.dart';
import 'package:reviza_app/widgets/settings_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  bool value = true;
  final NotiService notiService = NotiService();
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  children: [
                    SettingsBackButton(
                      pageName: 'Your Profile',
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ProfileTile(
                      initialName: _name.isNotEmpty ? _name[0] : 'X',
                      fullName: _name.isNotEmpty ? _name : 'User',
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
                        children: [
                          Row(
                            spacing: 20,
                            children: [
                              Icon(Icons.notifications),
                              Text(
                                value
                                    ? 'Turn off notifications'
                                    : 'Turn on notifications',
                                style: TextStyle(
                                  fontSize: AppText.verySmallText + 6,
                                ),
                              ),
                              Spacer(),
                              Switch(
                                  value: value,
                                  activeColor: AppColor.dodgerBlue,
                                  inactiveTrackColor: Colors.grey,
                                  trackOutlineColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  thumbColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      value = newValue;
                                      value
                                          ? NotiService().showNotifications(
                                              title: 'Reviza App Notification!',
                                              body:
                                                  'You are now receiving Reviza notifications',
                                            )
                                          : NotiService().showNotifications(
                                              title: 'Reviza App Notification!',
                                              body:
                                                  'You have turned off notifications',
                                            );
                                    });
                                  })
                            ],
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpgradeAccount())),
                            child: SettingsTile(
                                settingName: 'Saved Questions',
                                iconName: Icons.bookmark),
                          ),
                          SettingsTile(
                              settingName: 'Upcoming Updates',
                              iconName: Icons.update),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpgradeAccount())),
                            child: SettingsTile(
                                settingName: 'Upgrade Your Account',
                                iconName: Icons.star_border_purple500_outlined),
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ContactDevelopersPage())),
                            child: SettingsTile(
                                settingName: 'Contact Developers',
                                iconName: Icons.phone),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    /*ElevatedButton(
                      onPressed: () {
                        NotiService().scheduledNotification(
                            title: 'Daily Reminder',
                            body:
                                'Open Reviza, you have 20 questions waiting for you',
                            hour: 11,
                            minute: 35);
                      },
                      child: Text('Schedule Notification'),
                    ),*/
                    AppVersion(versionNumber: '0.1.2')
                  ],
                ))));
  }
}
