import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/repository.dart';


class LeaderboardUseCase {
  final TokenRepository tokenRepository;
  final LeaderboardRepository leaderboardRepository;

  LeaderboardUseCase({required this.tokenRepository, required this.leaderboardRepository});

  Future<PartialUsers> getTotalRankers() async {
    try{
      return await leaderboardRepository.fetchTotalRanker();
    } on ErrorWithMessage{
      rethrow;
    }
  }

  Future<PartialUsers> getMonthRankers() async {
    try{
      return await leaderboardRepository.fetchMonthRanker();
    } on ErrorWithMessage{
      rethrow;
    }
  }

  Future<PartialUsers> getWeekRankers() async {
    try{
      return await leaderboardRepository.fetchWeekRanker();
    } on ErrorWithMessage{
      rethrow;
    }
  }
}