import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/repository/leaderboard_repository.dart';
import 'package:cafejari_flutter/data/repository/push_repository.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/leader_use_case/get_leader_infos.dart';

abstract class LeaderUseCase {
  Future<List> getLeaderInfos(
      {required String accessToken});
}

class LeaderUseCaseImpl extends BaseUseCase implements LeaderUseCase {
  final TokenRepository tokenRepository;
  final LeaderRepository leaderRepository;

  LeaderUseCaseImpl({required this.tokenRepository, required this.leaderRepository});

  @override
  Future<List> getLeaderInfos(
      {required String accessToken}) async {
    final f = GetLeaderInfos();
    try{
      return f(
          accessToken: accessToken,
          tokenRepository: tokenRepository,
          leaderRepository: leaderRepository
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try{
        return f(
            accessToken: newToken,
            tokenRepository: tokenRepository,
            leaderRepository: leaderRepository
        );
      } on AccessTokenExpired{
        throw ErrorWithMessage("원인 모를 에러 발생, 앱을 재시작 해보세요");
      } on ErrorWithMessage{
        rethrow;
      }
    }on RefreshTokenExpired{
      rethrow;
    }on ErrorWithMessage{
      rethrow;
    }
  }

}