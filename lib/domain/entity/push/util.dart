
import 'package:flutter/material.dart';

sealed class PushType {
  final String tag, description;
  final Icon icon;

  PushType(this.tag, this.description, this.icon);

  factory PushType.notification() => Notification(
    "공지", "공지사항 알림이에요", const Icon(Icons.confirmation_num_sharp));

  factory PushType.activity() => Activity(
    "활동", "혼잡도 등록, 카페로그와 관련된 활동에 대한 알림이에요", const Icon(Icons.confirmation_num_sharp));

  factory PushType.event() => Event(
    "이벤트", "이벤트 안내 알림이에요", const Icon(Icons.confirmation_num_sharp));

  factory PushType.marketing() => Marketing(
    "마케팅", "광고, 홍보 알림이에요. 알림을 그만 보려면 '마케팅 정보 수신' 설정을 해제 해주세요", const Icon(Icons.confirmation_num_sharp));

  factory PushType.etc() => Etc(
    "기타", "기타 알림이에요", const Icon(Icons.confirmation_num_sharp));
}

class Notification extends PushType {
  Notification(super.tag, super.description, super.icon);
}

class Activity extends PushType {
  Activity(super.tag, super.description, super.icon);
}

class Event extends PushType {
  Event(super.tag, super.description, super.icon);
}

class Marketing extends PushType {
  Marketing(super.tag, super.description, super.icon);
}

class Etc extends PushType {
  Etc(super.tag, super.description, super.icon);
}