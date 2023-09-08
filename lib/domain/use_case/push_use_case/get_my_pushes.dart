
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/string.dart';
import 'package:cafejari_flutter/data/remote/dto/push/push_response.dart';
import 'package:cafejari_flutter/data/repository/push_repository.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';

/// getPushes의 실제 구현부
class GetPushes {
  Future<Pushes> call({
    required PushRepository pushRepository, required String accessToken}) async {
    try {
      List<PushResponse> pushResponseList = await pushRepository.fetchMyPush(accessToken: accessToken);
      Pushes resList =  pushResponseList.map((pushResponse) {
        return Push(
          id: pushResponse.id,
          title: pushResponse.title,
          body: pushResponse.body,
          pushedAt: DateTime.parse(pushResponse.pushed_at),
          type: pushResponse.type.toPushType()
        );
      }).toList();
      resList.sort((a, b) => b.pushedAt.compareTo(a.pushedAt));
      return resList;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}