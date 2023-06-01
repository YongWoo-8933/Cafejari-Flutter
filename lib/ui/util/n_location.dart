import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:cafejari_flutter/ui/util/zoom.dart';

class NLocation {
  final String name;
  final NCameraPosition cameraPosition;

  NLocation({required this.name, required this.cameraPosition});

  factory NLocation.sinchon() => NLocation(
      name: "신촌역",
      cameraPosition: const NCameraPosition(
          target: NLatLng(37.55649747287372, 126.93710302643744), zoom: Zoom.medium));

  factory NLocation.hongik() => NLocation(
      name: "홍대입구역",
      cameraPosition:
          const NCameraPosition(target: NLatLng(37.557176, 126.924175), zoom: Zoom.medium));

  factory NLocation.ewha() => NLocation(
      name: "이대역",
      cameraPosition:
          const NCameraPosition(target: NLatLng(37.557407, 126.945836), zoom: Zoom.medium));

  factory NLocation.hyehwa() => NLocation(
      name: "혜화(대학로)역",
      cameraPosition:
          const NCameraPosition(target: NLatLng(37.582351, 127.001308), zoom: Zoom.medium));

  factory NLocation.konkuk() => NLocation(
      name: "건대 입구역",
      cameraPosition:
          const NCameraPosition(target: NLatLng(37.540778, 127.071034), zoom: Zoom.medium));

  factory NLocation.wangsimni() => NLocation(
      name: "왕십리역",
      cameraPosition:
          const NCameraPosition(target: NLatLng(37.561233, 127.039957), zoom: Zoom.medium));

  factory NLocation.anam() => NLocation(
      name: "안암(고려대)역",
      cameraPosition:
          const NCameraPosition(target: NLatLng(37.586277, 127.028590), zoom: Zoom.medium));

  static List<NLocation> locations = [
    NLocation.sinchon(),
    NLocation.hongik(),
    NLocation.ewha(),
    NLocation.hyehwa(),
    NLocation.konkuk(),
    NLocation.wangsimni(),
    NLocation.anam()
  ];
}
