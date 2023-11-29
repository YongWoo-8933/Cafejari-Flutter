import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/leaderboard/leaderboard_response.dart';
import 'package:cafejari_flutter/data/repository/leaderboard_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/domain/entity/cafe_log/cafe_log.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/leaderboard_use_case/get_rankers.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';

abstract class LeaderboardUseCase {
  Future<PartialUsers> getTotalRankers();
  Future<PartialUsers> getMonthRankers();
  Future<PartialUsers> getWeekRankers();
  Future<CafeLogs> getMonthlyHotCafeLogs();
}

class LeaderboardUseCaseImpl extends BaseUseCase implements LeaderboardUseCase {
  final TokenRepository tokenRepository;
  final LeaderboardRepository leaderboardRepository;

  LeaderboardUseCaseImpl({required this.tokenRepository, required this.leaderboardRepository});

  @override
  Future<PartialUsers> getTotalRankers() async {
    final f = GetRankers();
    try{
      return await f(
          leaderboardRepository: leaderboardRepository,
          type: GetRankerType.total
      );
    } on ErrorWithMessage{
      rethrow;
    }
  }

  @override
  Future<PartialUsers> getMonthRankers() async {
    final f = GetRankers();
    try{
      return await f(
        leaderboardRepository: leaderboardRepository,
        type: GetRankerType.month
      );
    } on ErrorWithMessage{
      rethrow;
    }
  }

  @override
  Future<PartialUsers> getWeekRankers() async {
    final f = GetRankers();
    try{
      return await f(
          leaderboardRepository: leaderboardRepository,
          type: GetRankerType.week
      );
    } on ErrorWithMessage{
      rethrow;
    }
  }

  @override
  Future<CafeLogs> getMonthlyHotCafeLogs() async {
    try {
      List<MonthlyHotCafeLogResponse> monthlyHotCafeLogResponseList = await leaderboardRepository.fetchMonthlyHotCafeLog();
      CafeLogs cafeLogs = [];
      for(MonthlyHotCafeLogResponse monthlyHotCafeLogResponse in monthlyHotCafeLogResponseList) {
        cafeLogs.add(parseCafeLogFromCafeLogResponse(cafeLogResponse: monthlyHotCafeLogResponse.cafe_log));
      }
      return cafeLogs;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}