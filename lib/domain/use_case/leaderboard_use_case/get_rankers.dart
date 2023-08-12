
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/leaderboard/leaderboard_response.dart';
import 'package:cafejari_flutter/data/repository/leaderboard_repository.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';

enum GetRankerType { total, month, week }

/// getRankers의 실제 구현부
class GetRankers {
  Future<PartialUsers> call({
    required LeaderboardRepository leaderboardRepository, required GetRankerType type}) async {
    try {
      List<RankerResponse> rankerResponseList;
      switch(type) {
        case GetRankerType.total:
          rankerResponseList = await leaderboardRepository.fetchTotalRanker();
        case GetRankerType.month:
          rankerResponseList = await leaderboardRepository.fetchMonthRanker();
        case GetRankerType.week:
          rankerResponseList = await leaderboardRepository.fetchWeekRanker();
      }
      return rankerResponseList.map((e) {
        return parsePartialUserFromPartialUserResponse(
          partialUserResponse: e.user,
          updateCount: e.sharing_count
        );
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }
}