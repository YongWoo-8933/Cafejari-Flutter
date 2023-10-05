
import 'package:cafejari_flutter/domain/entity/push/util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'push.freezed.dart';


typedef Pushes = List<Push>;

/// cafe log 모델
@freezed
class Push with _$Push {
  factory Push({
    required final int id,
    required final String title,
    required final String body,
    required final DateTime pushedAt,
    required final bool isRead,
    required final PushType type
  }) = _Push;

  factory Push.empty() => Push(
      id: 0,
      title: "",
      body: "",
      pushedAt: DateTime(2022),
      isRead: true,
      type: PushType.etc());
}

