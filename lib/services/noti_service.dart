import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // Initialize
  Future<void> initNotification() async {
    if (_isInitialized) return;

    //android initi settings
    const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettings = InitializationSettings(android: initSettingsAndroid);

    await notificationPlugin.initialize(initSettings);
  }

  // Notifications detail setup
  NotificationDetails notificationDetails() {
    return NotificationDetails(
        android: AndroidNotificationDetails(
      'reviza_notification',
      'Daliy Notifications',
      channelDescription: 'Daily Notifications Channel',
      importance: Importance.high,
      priority: Priority.high,
    ));
  }

  // Show notifications

  // On tap
}
