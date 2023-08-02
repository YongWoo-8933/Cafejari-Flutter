import 'package:cafejari_flutter/core/flutter_local_notification.dart';
import 'package:cafejari_flutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafejari_flutter/cafejari_app.dart';

import 'core/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 로컬 저장소 init
  Hive.initFlutter();

  // Firebase init
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterLocalNotification.init();
  FirebaseMessaging.instance
      .setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    FlutterLocalNotification.showNotification(
        title: message.notification?.title, body: message.notification?.body);
  });

  // Naver map init
  await NaverMapSdk.instance.initialize(
      clientId:
          await getValueFromJsonFile(fileName: "secret.json", stringKey: "naver_map_client_id"));

  runApp(const ProviderScope(child: CafejariApp()));
}