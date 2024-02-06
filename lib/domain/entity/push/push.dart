
import 'package:cafejari_flutter/domain/entity/push/util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'push.freezed.dart';


typedef Pushes = List<Push>;

/// push 모델
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


typedef PopUps = List<PopUp>;

/// pop up 모델
@freezed
class PopUp with _$PopUp {
  factory PopUp({
    required final int id,
    required final int? inAppRouteTargetIndex,
    required final int? cafeId,
    required final int? challengeId,
    required final String title,
    required final String imageUrl,
    required final String? webViewUrl,
    required final String? externalUrl
  }) = _PopUp;

  factory PopUp.empty() => PopUp(
      id: 0,
      inAppRouteTargetIndex: null,
      cafeId: null,
      challengeId: null,
      title: "",
      imageUrl: "",
      webViewUrl: null,
      externalUrl: null);
}

