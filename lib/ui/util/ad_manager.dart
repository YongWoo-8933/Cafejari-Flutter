import 'package:flutter/cupertino.dart';
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

  factory AdManager.init({required TargetPlatform targetPlatform}) => instance = AdManager(
    myCafeScreenBannerAd: _loadBannerAd(targetPlatform),
    challengeScreenBannerAd: _loadBannerAd(targetPlatform),
    myPageScreenBannerAd: _loadBannerAd(targetPlatform),
    shopScreenBannerAd: _loadBannerAd(targetPlatform),
    notificationScreenBannerAd: _loadBannerAd(targetPlatform),
    bottomFullSheetBannerAd: _loadBannerAd(targetPlatform),
  );

  loadMyCafeScreenBannerAd({required TargetPlatform targetPlatform}) => _loadBannerAd(targetPlatform);
  loadChallengeScreenBannerAd({required TargetPlatform targetPlatform}) => _loadBannerAd(targetPlatform);
  loadMyPageScreenBannerAd({required TargetPlatform targetPlatform}) => _loadBannerAd(targetPlatform);
  loadShopScreenBannerAd({required TargetPlatform targetPlatform}) => _loadBannerAd(targetPlatform);
  loadNotificationScreenBannerAd({required TargetPlatform targetPlatform}) => _loadBannerAd(targetPlatform);
  loadBottomFullSheetBannerAd({required TargetPlatform targetPlatform}) => _loadBannerAd(targetPlatform);
}

AdManagerBannerAd _loadBannerAd(TargetPlatform targetPlatform) {
  const String androidBannerAdUnitId = 'ca-app-pub-4181634903165130/5331376786';
  const String iosBannerAdUnitId = 'ca-app-pub-4181634903165130/6823571792';

  String adUnitId = androidBannerAdUnitId;
  if(targetPlatform == TargetPlatform.iOS) adUnitId = iosBannerAdUnitId;

  return AdManagerBannerAd(
    adUnitId: adUnitId,
    request: const AdManagerAdRequest(),
    sizes: [AdSize.banner],
    listener: AdManagerBannerAdListener(),
  )..load();
}