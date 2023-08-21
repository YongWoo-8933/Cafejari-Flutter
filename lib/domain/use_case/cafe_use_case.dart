import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/repository/request_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/request/request.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case/get_map_cafes.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case/get_my_cafe_addition_requests.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case/get_my_occupancy_updates.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';

/// 카페관련 관련 data CRUD를 처리하는 use case
abstract interface class CafeUseCase {
  Future<Cafes> getMapCafes({required NCameraPosition cameraPosition});
  Future<Cafes> getSearchCafes({required String query});
  Future<OccupancyRateUpdates> getMyOccupancyUpdates({required String accessToken});
  Future<OccupancyRateUpdates> getMyRecentOccupancyUpdates({required String accessToken});
  Future<CafeAdditionRequests> getMyCafeAdditionRequests({required String accessToken});
}

/// CafeUseCase 구현 부분
class CafeUseCaseImpl extends BaseUseCase implements CafeUseCase {
  final TokenRepository tokenRepository;
  final CafeRepository cafeRepository;
  final RequestRepository requestRepository;

  CafeUseCaseImpl({
    required this.tokenRepository,
    required this.cafeRepository,
    required this.requestRepository});

  @override
  Future<Cafes> getMapCafes({required NCameraPosition cameraPosition}) async {
    final f = GetMapCafes();
    try {
      return await f(
          cafeRepository: cafeRepository,
          cameraPosition: cameraPosition
      );
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Cafes> getSearchCafes({required String query}) async {
    try {
      List<CafeSearchResponse> cafeSearchResponseList = await cafeRepository.fetchSearchCafe(query: query);
      return cafeSearchResponseList.map((cafeSearchResponse) {
        return Cafe.empty().copyWith(
          id: cafeSearchResponse.id,
          name: cafeSearchResponse.name,
          address: cafeSearchResponse.address,
          latLng: NLatLng(cafeSearchResponse.latitude, cafeSearchResponse.longitude)
        );
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<OccupancyRateUpdates> getMyOccupancyUpdates({required String accessToken}) async {
    final f = GetMyOccupancyUpdates();
    try {
      return await f(
          cafeRepository: cafeRepository,
          accessToken: accessToken,
          type: GetMyOccupancyUpdateType.all
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try {
        return f(
            cafeRepository: cafeRepository,
            accessToken: newToken,
            type: GetMyOccupancyUpdateType.all
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

  @override
  Future<OccupancyRateUpdates> getMyRecentOccupancyUpdates({required String accessToken}) async {
    final f = GetMyOccupancyUpdates();
    try {
      return await f(
          cafeRepository: cafeRepository,
          accessToken: accessToken,
          type: GetMyOccupancyUpdateType.recent
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try {
        return await f(
            cafeRepository: cafeRepository,
            accessToken: newToken,
            type: GetMyOccupancyUpdateType.recent
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

  @override
  Future<CafeAdditionRequests> getMyCafeAdditionRequests({required String accessToken}) async {
    final f = GetMyCafeAdditionRequests();
    try {
      return await f(
          requestRepository: requestRepository,
          accessToken: accessToken
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try {
        return await f(
            requestRepository: requestRepository,
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