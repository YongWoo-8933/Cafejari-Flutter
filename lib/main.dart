import 'package:cafejari_flutter/core/flutter_local_notification.dart';
import 'package:cafejari_flutter/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafejari_flutter/cafejari_app.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() async {
  // 앱 시작
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // splash 화면 유지
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // dotenv init
  await dotenv.load(fileName: ".env");

  // 로컬 저장소 init
  Hive.initFlutter();

  // Firebase init
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAnalytics.instance.logAppOpen();

  // 알림 init
  FlutterLocalNotification.init();

  // Naver map init
  await NaverMapSdk.instance.initialize(clientId: dotenv.env['NAVER_MAP_CLIENT_ID']);

  // Kakao init
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY']);

  // 앱 시작
  runApp(const ProviderScope(child: CafejariApp()));
}
