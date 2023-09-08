
import 'package:flutter/material.dart';

sealed class PushType {
  final int index;
  final String tag, description;
  final Image image;

  PushType(this.index, this.tag, this.description, this.image);

  factory PushType.notification() => Notification(
    0, "공지", "공지사항 알림이에요",  Image.asset('asset/image/push_image.png', width: 55, height: 55,));

  factory PushType.activity() => Activity(
    1, "활동", "혼잡도 등록, 카페로그와 관련된 활동에 대한 알림이에요", Image.asset('asset/image/push_image.png', width: 55, height: 55));

  factory PushType.event() => Event(
    2, "이벤트", "이벤트 안내 알림이에요", Image.asset('asset/image/push_image.png', width: 55, height: 55));

  factory PushType.marketing() => Marketing(
    3, "마케팅", "광고, 홍보 알림이에요. 알림을 그만 보려면 '마케팅 정보 수신' 설정을 해제 해주세요", Image.asset('asset/image/push_image.png', width: 55, height: 55));

  factory PushType.etc() => Etc(
    4, "기타", "기타 알림이에요", Image.asset('asset/image/push_image.png', width: 55, height: 55));
}

class Notification extends PushType {
  Notification(super.index, super.tag, super.description, super.image);
}

class Activity extends PushType {
  Activity(super.index, super.tag, super.description, super.image);
}

class Event extends PushType {
  Event(super.index, super.tag, super.description, super.image);
}

class Marketing extends PushType {
  Marketing(super.index, super.tag, super.description, super.image);
}

class Etc extends PushType {
  Etc(super.index, super.tag, super.description, super.icon);
}