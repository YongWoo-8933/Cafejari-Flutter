import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  static AdManager instance = AdManager();

  AdManagerBannerAd? myCafeScreenBannerAd;
  AdManagerBannerAd? challengeScreenBannerAd;
  AdManagerBannerAd? myPageScreenBannerAd;
  AdManagerBannerAd? shopScreenBannerAd;
  AdManagerBannerAd? notificationScreenBannerAd;
  AdManagerBannerAd? bottomFullSheetBannerAd;

  AdManager({
    this.myCafeScreenBannerAd,
    this.challengeScreenBannerAd,
    this.myPageScreenBannerAd,
    this.shopScreenBannerAd,
    this.notificationScreenBannerAd,
    this.bottomFullSheetBannerAd
  });

  factory AdManager.init() => instance = AdManager(
    myCafeScreenBannerAd: _loadBannerAd(),
    challengeScreenBannerAd: _loadBannerAd(),
    myPageScreenBannerAd: _loadBannerAd(),
    shopScreenBannerAd: _loadBannerAd(),
    notificationScreenBannerAd: _loadBannerAd(),
    bottomFullSheetBannerAd: _loadBannerAd(),
  );
}

AdManagerBannerAd _loadBannerAd() {
  const String androidBannerAdUnitId = 'ca-app-pub-4181634903165130/5331376786';
  const String iosBannerAdUnitId = 'ca-app-pub-4181634903165130/9461508692';

  String adUnitId = androidBannerAdUnitId;
  if(Platform.isIOS) adUnitId = iosBannerAdUnitId;

  return AdManagerBannerAd(
    adUnitId: adUnitId,
    request: const AdManagerAdRequest(),
    sizes: [AdSize.banner],
    listener: AdManagerBannerAdListener(),
  )..load();
}