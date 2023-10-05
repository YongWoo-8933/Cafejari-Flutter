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
}
