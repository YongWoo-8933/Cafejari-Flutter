
/// enum 타입 명을 string 값으로 가져 온다.
extension GetStringValueFromName on Enum {
  String getStringValueFromName() => toString().split('.').last;
}
