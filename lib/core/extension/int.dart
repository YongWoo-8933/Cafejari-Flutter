
/// 정수 층을 텍스트로 변환
extension GetFloorFromInt on dynamic {
  String toFloor() {
    if(this > 0) {
      return "$this";
    } else if (this < 0) {
      return "B${this.abs()}";
    } else {
      return "";
    }
  }
}