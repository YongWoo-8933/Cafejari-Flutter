import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/request/request.dart';
import 'package:cafejari_flutter/domain/repository.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:cafejari_flutter/core/exception.dart';


class CafeUseCase {
  final TokenRepository tokenRepository;
  final CafeRepository cafeRepository;
  final RequestRepository requestRepository;

  CafeUseCase({
    required this.tokenRepository,
    required this.cafeRepository,
    required this.requestRepository});

  Future<Cafes> getMapCafes({required NCameraPosition cameraPosition}) async {
    try {
      return await cafeRepository.fetchMapCafe(
        latitude: cameraPosition.target.latitude,
        longitude: cameraPosition.target.longitude,
        zoomLevel: cameraPosition.zoom.calculateZoomLevel()
      );
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Cafe> getCafe({required int cafeId}) async {
    try {
      return await cafeRepository.retrieveCafe(cafeId: cafeId);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Cafes> getSearchCafes({required String query, double? latitude, double? longitude}) async {
    try {
      return cafeRepository.fetchSearchCafe(query: query, latitude: latitude, longitude: longitude);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Cafes> getRecommendedCafes({required double latitude, required double longitude}) async {
    try {
      return await cafeRepository.fetchRecommendedCafe(latitude: latitude, longitude: longitude);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<OccupancyRateUpdates> getMyOccupancyUpdates({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await cafeRepository.fetchMyOccupancyUpdate(accessToken: accessToken);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await cafeRepository.fetchMyOccupancyUpdate(accessToken: newToken);
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Map<int, OccupancyRateUpdates>> getMyTodayOccupancyUpdates({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await cafeRepository.fetchMyTodayOccupancyUpdate(accessToken: accessToken);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await cafeRepository.fetchMyTodayOccupancyUpdate(accessToken: newToken);
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<NaverSearchCafes> getNaverSearchCafes({required String query}) async {
    try {
      return await cafeRepository.fetchNaverSearchResult(query: query);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Locations> getLocations() async {
    try {
      return await cafeRepository.fetchLocation();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<OccupancyRateUpdate> updateOccupancy({
    required double occupancyRate,
    required int cafeFloorId,
    String? accessToken,
    Function(String)? onAccessTokenRefresh
  }) async {
    try {
      if(accessToken.isNull) {
        // 게스트 업데이트
        return await cafeRepository.postOccupancyRateAsGuest(
          occupancyRate: occupancyRate, cafeFloorId: cafeFloorId
        );
      } else {
        // 유저 업데이트
        return await cafeRepository.postOccupancyRateAsUser(
          accessToken: accessToken!, occupancyRate: occupancyRate, cafeFloorId: cafeFloorId
        );
      }
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      if(onAccessTokenRefresh.isNotNull) onAccessTokenRefresh!(newToken);
      try {
        // 유저 업데이트
        return await cafeRepository.postOccupancyRateAsUser(
            accessToken: newToken, occupancyRate: occupancyRate, cafeFloorId: cafeFloorId
        );
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<CafeAdditionRequest> requestCafeAddition({
    required String accessToken,
    required String cafeName,
    required String dongAddress,
    required String roadAddress,
    required double latitude,
    required double longitude,
    required int topFloor,
    required int bottomFloor,
    required List<double> wallSocketRateList,
    required List<String> openingHourList,
    required String etc,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await requestRepository.postCafeAdditionRequest(
        accessToken: accessToken,
        cafeName: cafeName,
        dongAddress: dongAddress,
        roadAddress: roadAddress,
        latitude: latitude,
        longitude: longitude,
        topFloor: topFloor,
        bottomFloor: bottomFloor,
        wallSocketRateList: wallSocketRateList,
        openingHourList: openingHourList,
        etc: etc
      );
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await requestRepository.postCafeAdditionRequest(
          accessToken: newToken,
          cafeName: cafeName,
          dongAddress: dongAddress,
          roadAddress: roadAddress,
          latitude: latitude,
          longitude: longitude,
          topFloor: topFloor,
          bottomFloor: bottomFloor,
          wallSocketRateList: wallSocketRateList,
          openingHourList: openingHourList,
          etc: etc
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

  Future<CafeModificationRequest> requestCafeModification({
    required String accessToken,
    required bool isClosed,
    required int cafeId,
    required int topFloor,
    required int bottomFloor,
    required Function(String) onAccessTokenRefresh,
    List<double>? wallSocketRateList,
    List<String>? openingHourList,
    List<String>? restRoomList,
    double? latitude,
    double? longitude,
    String? etc
  }) async {
    try {
      return await requestRepository.postCafeModificationRequest(
        accessToken: accessToken,
        isClosed: isClosed,
        cafeId: cafeId,
        topFloor: topFloor,
        bottomFloor: bottomFloor,
        wallSocketRateList: wallSocketRateList,
        openingHourList: openingHourList,
        restRoomList: restRoomList,
        latitude: latitude,
        longitude: longitude,
        etc: etc
      );
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await requestRepository.postCafeModificationRequest(
          accessToken: newToken,
          isClosed: isClosed,
          cafeId: cafeId,
          topFloor: topFloor,
          bottomFloor: bottomFloor,
          wallSocketRateList: wallSocketRateList,
          openingHourList: openingHourList,
          restRoomList: restRoomList,
          latitude: latitude,
          longitude: longitude,
          etc: etc
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

  Future<void> voteCATI({
    required String accessToken,
    required int cafeId,
    required int openness,
    required int coffee,
    required int workspace,
    required int acidity,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      await cafeRepository.postCATI(
        accessToken: accessToken,
        cafeId: cafeId,
        openness: openness,
        coffee: coffee,
        workspace: workspace,
        acidity: acidity
      );
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        await cafeRepository.postCATI(
          accessToken: newToken,
          cafeId: cafeId,
          openness: openness,
          coffee: coffee,
          workspace: workspace,
          acidity: acidity
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