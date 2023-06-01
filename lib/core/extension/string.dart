import 'package:cafejari_flutter/core/util.dart';

/// 해당 string이 "_none"인지 확인해줌
extension IsNone on String {
  bool get isNone => this == none;
  bool get isNotNone => this != none;
}