import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/leader/leaderboard_response.dart';
import 'package:cafejari_flutter/data/repository/leaderboard_repository.dart';
import 'package:cafejari_flutter/data/repository/push_repository.dart';
import 'package:cafejari_flutter/domain/entity/leader/leader_info.dart';


/// getLeaderInfos의 실제 구현부
class GetLeaderInfos {
  Future<List> call(
      {required LeaderRepository leaderRepository,
        required TokenRepository tokenRepository,
        required String accessToken}) async {
    try {
      List<LeaderResponse> leaderInfoResponseList = await leaderRepository.fetchMonthLeaderBoard(
          accessToken: accessToken
      );

      List<LeaderResponse> weekLeaderInfoResponseList = await leaderRepository.fetchWeekLeaderBoard(
          accessToken: accessToken
      );

      LeaderInfos monthLeaderInfos = [];
      for (LeaderResponse leaderInfoResponse in leaderInfoResponseList) {
        monthLeaderInfos.add(
            LeaderInfo(
              id: leaderInfoResponse.id,
              activity: leaderInfoResponse.activity,
              ranking: leaderInfoResponse.ranking,
              nickname: leaderInfoResponse.user.profile?.nickname,
              image: leaderInfoResponse.user.profile?.image,
            )
        );
      }

      LeaderInfos weekLeaderInfos = [];
      for (LeaderResponse leaderInfoResponse in weekLeaderInfoResponseList) {
        weekLeaderInfos.add(
            LeaderInfo(
              id: leaderInfoResponse.id,
              activity: leaderInfoResponse.activity,
              ranking: leaderInfoResponse.ranking,
              nickname: leaderInfoResponse.user.profile?.nickname,
              image: leaderInfoResponse.user.profile?.image,
            )
        );
      }

      List<List> leaderInfo = [monthLeaderInfos, weekLeaderInfos];

      return leaderInfo;
    } on ErrorWithMessage {
      rethrow;
    } on AccessTokenExpired {
      rethrow;
    }
  }
}
