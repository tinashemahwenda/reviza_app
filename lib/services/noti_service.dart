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
  }

  // Notifications detail setup

  // Show notifications

  // On tap
}
