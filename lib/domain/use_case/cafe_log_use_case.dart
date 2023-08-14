import 'package:cafejari_flutter/data/repository/cafe_log_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/domain/entity/cafe_log/cafe_log.dart';
import 'package:cafejari_flutter/domain/entity/pagination.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_log_use_case/get_cafe_logs.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';

/// 카페로그 관련 data를 처리하는 use case
abstract interface class CafeLogUseCase {
  Future<Pagination<CafeLog>> getRecentCafeLogs();
  Future<Pagination<CafeLog>> getHotCafeLogs();
  Future<Pagination<CafeLog>> getMyCafeLogs({required String accessToken});
}

/// CafeLogUseCase 구현 부분
class CafeLogUseCaseImpl extends BaseUseCase implements CafeLogUseCase {
  final TokenRepository tokenRepository;
  final CafeLogRepository cafeLogRepository;

  CafeLogUseCaseImpl({required this.tokenRepository, required this.cafeLogRepository});

  @override
  Future<Pagination<CafeLog>> getRecentCafeLogs() async {
    final f = GetCafeLogs();
    try {
      return await f(
        cafeLogRepository: cafeLogRepository,
        type: GetCafeLogType.recent
      );
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Pagination<CafeLog>> getHotCafeLogs() async {
    final f = GetCafeLogs();
    try {
      return await f(
        cafeLogRepository: cafeLogRepository,
        type: GetCafeLogType.hot
      );
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Pagination<CafeLog>> getMyCafeLogs({required String accessToken}) async {
    final f = GetCafeLogs();
    try {
      return await f(
          cafeLogRepository: cafeLogRepository,
          type: GetCafeLogType.hot,
          accessToken: accessToken
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try {
        return await f(
            cafeLogRepository: cafeLogRepository,
            type: GetCafeLogType.hot,
            accessToken: newToken
        );
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}