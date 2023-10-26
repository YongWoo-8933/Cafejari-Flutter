import 'package:flutter/cupertino.dart';

sealed class PushType {
  final int index;
  final String tag, description;
  final IconData iconData;

  PushType(this.index, this.tag, this.description, this.iconData);

  factory PushType.notification() => Notification(
    0, "공지", "공지사항 알림이에요", CupertinoIcons.exclamationmark_bubble);

  factory PushType.activity() => Activity(
    1, "활동", "혼잡도 등록, 카페로그와 관련된 활동에 대한 알림이에요", CupertinoIcons.person_2);

  factory PushType.event() => Event(
    2, "이벤트", "이벤트 안내 알림이에요", CupertinoIcons.tickets);

  factory PushType.marketing() => Marketing(
    3, "마케팅", "광고, 홍보 알림이에요. 알림을 그만 보려면 '마케팅 정보 수신' 설정을 해제 해주세요", CupertinoIcons.shopping_cart);

  factory PushType.etc() => Etc(
    4, "기타", "기타 알림이에요", CupertinoIcons.bell);
}

class Notification extends PushType {
  Notification(super.index, super.tag, super.description, super.iconData);
}

class Activity extends PushType {
  Activity(super.index, super.tag, super.description, super.iconData);
}

class Event extends PushType {
  Event(super.index, super.tag, super.description, super.iconData);
}

class Marketing extends PushType {
  Marketing(super.index, super.tag, super.description, super.iconData);
}

class Etc extends PushType {
  Etc(super.index, super.tag, super.description, super.iconData);
}