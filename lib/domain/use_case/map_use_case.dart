import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/domain/entity/cafe_info/cafe_info.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/map_use_case/get_cafe_infos.dart';

/// 지도 관련 data CRUD를 처리하는 use case
abstract interface class MapUseCase {
  Future<CafeInfos> getCafeInfos(
      {required String accessToken,
      required NCameraPosition cameraPosition});
}

/// MapUseCase 구현 부분
class MapUseCaseImpl extends BaseUseCase implements MapUseCase {
  final TokenRepository tokenRepository;
  final CafeRepository cafeRepository;

  MapUseCaseImpl({required this.tokenRepository, required this.cafeRepository});

  @override
  Future<CafeInfos> getCafeInfos(
      {required String accessToken,
        required NCameraPosition cameraPosition}) async {
    final f = GetCafeInfos();
    try {
      return f(
        cafeRepository: cafeRepository,
        tokenRepository: tokenRepository,
        accessToken: accessToken,
        cameraPosition: cameraPosition
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try {
        return f(
          cafeRepository: cafeRepository,
          tokenRepository: tokenRepository,
          accessToken: newToken,
          cameraPosition: cameraPosition
        );
      } on AccessTokenExpired {
        throw ErrorWithMessage("원인 모를 에러 발생, 앱을 재시작 해보세요");
      } on ErrorWithMessage {
        rethrow;
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}
