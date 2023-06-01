
/// 해당 타입이 null 인지 아닌지 체크
extension NullCheck on dynamic {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}