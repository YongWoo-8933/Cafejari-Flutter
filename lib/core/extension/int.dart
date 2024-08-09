
/// 정수 층을 텍스트로 변환
extension GetFloorFromInt on int {
  String toFloor() {
    if(this > 0) {
      return "$this";
    } else if (this < 0) {
      return "B${abs()}";
    } else {
      return "";
    }
  }
}

/// 시간, 분 정보에서 1자리 -> 2자리로 변환 ex) 5 -> 05
extension Get2DigitIntFromInt on int {
  String toTwoDigitMinute() {
    if(this < 10) {
      return "0$this";
    } else {
      return "$this";
    }
  }
}

/// cati slider int값을 실제 cati int값으로 바꿔줌
extension CATISliderIntToCATIInt on int {
  int toCATIInt() {
    switch(this) {
      case -3: return -2;
      case -1: return -1;
      case 1: return 1;
      case 3: return 2;
      default: return 1;
    }
  }
}

/// cati int값을 실제 cati slider int값으로 바꿔줌
extension CATIIntToCATISliderInt on int {
  int toCATISliderInt() {
    switch(this) {
      case -2: return -3;
      case -1: return -1;
      case 1: return 1;
      case 2: return 3;
      default: return 1;
    }
  }
}