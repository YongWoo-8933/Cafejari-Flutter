import 'package:cafejari_flutter/core/flutter_local_notification.dart';
import 'package:cafejari_flutter/firebase_options.dart';
import 'package:cafejari_flutter/ui/util/ad_manager.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafejari_flutter/cafejari_app.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() async {
  // 앱 시작
  WidgetsFlutterBinding.ensureInitialized();

  // dotenv init
  await dotenv.load(fileName: ".env");

  // 로컬 저장소 init
  await Hive.initFlutter();

  // Firebase init
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Admob init
  await MobileAds.instance.initialize();

  // Firebase analytics 사용설정
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  FirebaseAnalytics.instance.logAppOpen();

  // Naver map init
  await NaverMapSdk.instance.initialize(clientId: dotenv.env['NAVER_MAP_CLIENT_ID']);

  // Kakao init
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY']);

  // 알림 init
  FlutterLocalNotification.init();

  // 광고 init
  AdManager.init();

  // 앱 시작
  runApp(const ProviderScope(child: CafejariApp()));
}
