import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// 알림을 보내 주는 class
/// static으로 구현해 singleton 패턴을 유지
class FlutterLocalNotification {
  FlutterLocalNotification._();

  static const _channelId = "high_importance_channel";
  static const _channelName = "High Importance Notifications";

  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// 채널 생성, 아이콘 설정 등 기본 init
  static init() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    DarwinInitializationSettings iosInitializationSettings = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel(
          _channelId,
          _channelName,
          importance: Importance.max,
        ));

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// 알림 권한 요청(추후 다른 클래스에서 관리)
  static requestNotificationPermission() {
    _flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
  }

  /// 알림을 보여줌
  static Future<void> showNotification({required String? title, required String? body}) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        _channelId, _channelName,
        importance: Importance.max, priority: Priority.max, showWhen: false);

    const NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: DarwinNotificationDetails(badgeNumber: 1));

    await _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
  }
}
