import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotiService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // Initialize notifications
  Future<void> initNotification() async {
    if (_isInitialized) return;

    const AndroidInitializationSettings initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: initSettingsAndroid,
    );

    await notificationPlugin.initialize(initSettings);

    // Create a notification channel (important for Android 8+)
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

    _isInitialized = true; // Mark as initialized
  }

  Future<void> requestPermissions() async {
    // Check and request notification permissions
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  // Notification details setup
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'reviza_notification', // MUST match the created channel ID
        'Daily Notifications',
        channelDescription: 'Daily Notifications Channel',
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
  }

  // Show notifications
  Future<void> showNotifications({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationPlugin.show(id, title, body, notificationDetails());
  }
}
