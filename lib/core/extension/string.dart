import 'package:cafejari_flutter/core/util.dart';
import 'package:cafejari_flutter/domain/entity/cafe_log/util.dart';
import 'package:cafejari_flutter/domain/entity/push/util.dart';
import 'package:html/parser.dart';

/// 해당 string이 "_none"인지 확인해줌
extension IsNone on String {
  bool get isNone => this == none;
  bool get isNotNone => this != none;
}

/// 해당 string으로부터 CafeLogTheme을 얻어냄
extension GetCafeTheme on String {
  CafeLogTheme toCafeLogTheme() {
    if(this == CafeLogTheme.study().tag) {
      return CafeLogTheme.study();
    } else if(this == CafeLogTheme.meeting().tag) {
      return CafeLogTheme.meeting();
    } else if(this == CafeLogTheme.healing().tag) {
      return CafeLogTheme.healing();
    } else {
      return CafeLogTheme.free();
    }
  }
}

/// 해당 string으로부터 PushType을 얻어냄
extension GetPushType on String {
  PushType toPushType() {
    if(this == PushType.notification().tag) {
      return PushType.notification();
    } else if(this == PushType.activity().tag) {
      return PushType.activity();
    } else if(this == PushType.event().tag) {
      return PushType.event();
    } else if(this == PushType.marketing().tag) {
      return PushType.marketing();
    } else {
      return PushType.etc();
    }
  }
}

/// html 태그와 함께 구성된 string 값에서 순수 text만을 추출
extension ExtractPlainText on String {
  String toPlainText() {
    try{
      return parse(parse(this).body!.text).documentElement!.text;
    } catch(e) {
      return this;
    }
  }
}