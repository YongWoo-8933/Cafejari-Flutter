
sealed class CafeLogTheme {
  final String tag, description;

  CafeLogTheme(this.tag, this.description);

  factory CafeLogTheme.study() => Study("카공/업무", "카페에서 업무를 보거나 자기 계발, 공부 등을 했어요");
  factory CafeLogTheme.meeting() => Study("만남", "카페에서 다른 사람과 함께 시간을 보냈어요");
  factory CafeLogTheme.healing() => Study("힐링", "카페의 분위기와 커피, 음악을 즐기다 왔어요");
  factory CafeLogTheme.free() => Study("자유", "카페에서 보낸 시간을 자유롭게 기록해 보세요");
}

class Study extends CafeLogTheme {
  Study(super.tag, super.description);
}

class Meeting extends CafeLogTheme {
  Meeting(super.tag, super.description);
}

class Healing extends CafeLogTheme {
  Healing(super.tag, super.description);
}

class Free extends CafeLogTheme {
  Free(super.tag, super.description);
}