import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotiService {
  final FlutterLocalNotificationsPlugin notificationPlugin =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // Initialize notifications
  Future<void> initNotification() async {
    if (_isInitialized) return;

    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    const AndroidInitializationSettings initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: initSettingsAndroid,
    );

    await notificationPlugin.initialize(initSettings);

    // Create a notification channel (important for Android 8+)
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'reviza_notification', // Must match the ID in notificationDetails()
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

  Future<void> requestPermissions() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'reviza_notification',
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

  Future<void> scheduledNotification({
    int id = 1,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    final now = tz.TZDateTime.now(tz.local);

    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // Ensure NotificationDetails is properly defined
    final NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        'reviza_notification', // Ensure this matches your channel ID
        'Daily Notifications',
        channelDescription: 'Daily Notifications Channel',
        importance: Importance.high,
        priority: Priority.high,
      ),
    );

    await notificationPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      details, // Pass the properly defined details here
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  //Cancel Notifications Function
  Future<void> cancelAllNotifications() async {
    await notificationPlugin.cancelAll();
  }
}
