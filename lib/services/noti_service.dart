import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // Initialize
  Future<void> initNotification() async {
    if (_isInitialized) return;

    //android initi settings
    const AndroidInitializationSettings initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: initSettingsAndroid);

    await notificationPlugin.initialize(initSettings);

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'reviza_notification', // Unique ID
      'Daily Notifications',
      description: 'Daily Notifications Channel',
      importance: Importance.high,
    );

    await notificationPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    _isInitialized = true;
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
  Future<void> showNotifications({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationPlugin.show(
        id, title, body, const NotificationDetails());
  }
  // On tap
}
