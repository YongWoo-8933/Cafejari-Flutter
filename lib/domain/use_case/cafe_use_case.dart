import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/remote/dto/request/request_response.dart';
import 'package:cafejari_flutter/data/repository/request_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/request/request.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case/get_map_cafes.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case/get_my_today_occupancy_updates.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case/update_occupancy_rate.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';

/// 카페관련 관련 data CRUD를 처리하는 use case
abstract interface class CafeUseCase {
  Future<Cafes> getMapCafes({required NCameraPosition cameraPosition});
  Future<Cafe> getCafe({required int cafeId});
  Future<Cafes> getSearchCafes({required String query});
  Future<OccupancyRateUpdates> getMyOccupancyUpdates({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  });
  Future<Cafes> getRecommendedCafes({
    required double latitude,
    required double longitude
  });
  Future<Map<int, OccupancyRateUpdates>> getMyTodayOccupancyUpdates({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  });
  Future<CafeAdditionRequests> getMyCafeAdditionRequests({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  });
  Future<NaverSearchCafes> getNaverSearchCafes({required String query});
  Future<Locations> getLocations();
  Future<OccupancyRateUpdate> updateOccupancy({
    required double occupancyRate,
    required int cafeFloorId,
    String? accessToken,
    Function(String)? onAccessTokenRefresh
  });
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
  });
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
  });
  Future<void> voteCATI({
    required String accessToken,
    required int cafeId,
    required int openness,
    required int coffee,
    required int workspace,
    required int acidity,
    required Function(String) onAccessTokenRefresh
  });
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
  Future<Cafe> getCafe({required int cafeId}) async {
    try {
      return parseCafeFromCafeResponse(await cafeRepository.retrieveCafe(cafeId: cafeId));
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
  Future<Cafes> getRecommendedCafes({required double latitude, required double longitude}) async {
    try {
      List<CafeResponse> cafeResponseList = await cafeRepository.fetchRecommendedCafe(
          latitude: latitude, longitude: longitude);
      return cafeResponseList.map((cafeResponse) {
        return parseCafeFromCafeResponse(cafeResponse);
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<OccupancyRateUpdates> getMyOccupancyUpdates({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      List<OccupancyRateUpdateResponse> updateResponseList;
      updateResponseList = await cafeRepository.fetchMyOccupancyUpdate(accessToken: accessToken);
      return updateResponseList.map((e) {
        return parseOccupancyRateUpdateFromOccupancyRateUpdateResponse(updateResponse: e);
      }).toList();
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        List<OccupancyRateUpdateResponse> updateResponseList;
        updateResponseList = await cafeRepository.fetchMyOccupancyUpdate(accessToken: newToken);
        return updateResponseList.map((e) {
          return parseOccupancyRateUpdateFromOccupancyRateUpdateResponse(updateResponse: e);
        }).toList();
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
  Future<Map<int, OccupancyRateUpdates>> getMyTodayOccupancyUpdates({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    final f = GetMyOccupancyUpdates();
    try {
      return await f(
        cafeRepository: cafeRepository,
        accessToken: accessToken,
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        return await f(cafeRepository: cafeRepository, accessToken: newToken);
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
  Future<CafeAdditionRequests> getMyCafeAdditionRequests({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      List<CafeAdditionRequestResponse> requestResponseList = await requestRepository.fetchMyCafeAdditionRequest(accessToken: accessToken);
      return requestResponseList.map((requestResponse) {
        return parseCafeAdditionRequestFromCafeAdditionRequestResponse(requestResponse: requestResponse);
      }).toList();
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        List<CafeAdditionRequestResponse> requestResponseList = await requestRepository.fetchMyCafeAdditionRequest(accessToken: newToken);
        return requestResponseList.map((requestResponse) {
          return parseCafeAdditionRequestFromCafeAdditionRequestResponse(requestResponse: requestResponse);
        }).toList();
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
  Future<NaverSearchCafes> getNaverSearchCafes({required String query}) async {
    try {
      NaverSearchCafeResponse searchCafeResponse = await cafeRepository.fetchNaverSearchResult(query: query);
      return searchCafeResponse.items.map((e) {
        return NaverSearchCafe(
          name: e.title,
          roadAddress: e.roadAddress,
          dongAddress: e.address,
          latitude: double.parse(e.mapy.substring(0, 2)) + double.parse("0.${e.mapy.substring(2)}"),
          longitude: double.parse(e.mapx.substring(0, 3)) + double.parse("0.${e.mapx.substring(3)}")
        );
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Locations> getLocations() async {
    try {
      List<LocationResponse> searchCafeResponse = await cafeRepository.fetchLocation();
      final Locations locations = searchCafeResponse.map((e) {
        return Location(
          name: e.name,
          imageUrl: e.image,
          latitude: e.latitude,
          longitude: e.longitude
        );
      }).toList();
      locations.sort((a, b) => a.name.compareTo(b.name));
      return locations;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<OccupancyRateUpdate> updateOccupancy({
    required double occupancyRate,
    required int cafeFloorId,
    String? accessToken,
    Function(String)? onAccessTokenRefresh
  }) async {
    final f = UpdateOccupancyRate();
    try {
      return await f(
        cafeRepository: cafeRepository,
        occupancyRate: occupancyRate,
        cafeFloorId: cafeFloorId,
        accessToken: accessToken
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      if(onAccessTokenRefresh.isNotNull) onAccessTokenRefresh!(newToken);
      try {
        return await f(
          cafeRepository: cafeRepository,
          occupancyRate: occupancyRate,
          cafeFloorId: cafeFloorId,
          accessToken: newToken
        );
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
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
      return parseCafeAdditionRequestFromCafeAdditionRequestResponse(
        requestResponse: await requestRepository.postCafeAdditionRequest(
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
        )
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        return parseCafeAdditionRequestFromCafeAdditionRequestResponse(
          requestResponse: await requestRepository.postCafeAdditionRequest(
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
          )
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
      return parseCafeModificationRequestFromCafeModificationRequestResponse(
        requestResponse: await requestRepository.postCafeModificationRequest(
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
        )
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        return parseCafeModificationRequestFromCafeModificationRequestResponse(
          requestResponse: await requestRepository.postCafeModificationRequest(
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
          )
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
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
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
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}