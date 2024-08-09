import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/request/request_response.dart';
import 'package:cafejari_flutter/data/repository/util.dart';
import 'package:cafejari_flutter/domain/entity/request/request.dart';
import 'package:cafejari_flutter/domain/repository.dart';

/// request repository의 구현부
class RequestRepositoryImpl implements RequestRepository {
  final APIService service;

  RequestRepositoryImpl(this.service);

  @override
  Future<CafeAdditionRequest> postCafeAdditionRequest({
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
    required String etc
  }) async {
    try {
      final dynamic response = await service.request(
        method: HttpMethod.post,
        appLabel: "request",
        endpoint: "cafe_addition/",
        accessToken: accessToken,
        body: {
          "cafe_name": cafeName,
          "dong_address": dongAddress,
          "road_address": roadAddress,
          "latitude": latitude,
          "longitude": longitude,
          "top_floor": topFloor,
          "bottom_floor": bottomFloor,
          "wall_socket_rate_list": wallSocketRateList,
          "opening_hour_list": openingHourList,
          "etc": etc
        }
      );
      final res = CafeAdditionRequestResponse.fromJson(response);
      return parseCafeAdditionRequestFromCafeAdditionRequestResponse(requestResponse: res);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<CafeModificationRequest> postCafeModificationRequest({
    required String accessToken,
    required bool isClosed,
    required int cafeId,
    required int topFloor,
    required int bottomFloor,
    List<double>? wallSocketRateList,
    List<String>? openingHourList,
    List<String>? restRoomList,
    double? latitude,
    double? longitude,
    String? etc
  }) async {
    Map<String, dynamic> requestBody = {
      "is_closed": isClosed,
      "cafe_id": cafeId,
      "top_floor": topFloor,
      "bottom_floor": bottomFloor
    };
    if (wallSocketRateList.isNotNull) requestBody["wall_socket_rate_list"] = wallSocketRateList!;
    if (openingHourList.isNotNull) requestBody["opening_hour_list"] = openingHourList!;
    if (restRoomList.isNotNull) requestBody["restroom_list"] = restRoomList!;
    if (latitude.isNotNull) requestBody["latitude"] = latitude!;
    if (longitude.isNotNull) requestBody["longitude"] = longitude!;
    if (etc.isNotNull) requestBody["etc"] = etc!;
    try {
      final dynamic response = await service.request(
        method: HttpMethod.post,
        appLabel: "request",
        endpoint: "cafe_information_suggestion/",
        accessToken: accessToken,
        body: requestBody
      );
      final res = CafeModificationRequestResponse.fromJson(response);
      return parseCafeModificationRequestFromCafeModificationRequestResponse(requestResponse: res);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<void> postUserWithdrawalRequest({required String accessToken, required String reason}) async {
    try {
      await service.request(
        method: HttpMethod.post,
        appLabel: "request",
        endpoint: "withdrawal/",
        accessToken: accessToken,
        body: {"reason": reason}
      );
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<void> postUserMigrationRequest({required String accessToken, required String phoneNumber}) async {
    try {
      await service.request(
        method: HttpMethod.post,
        appLabel: "request",
        endpoint: "user_migration/",
        accessToken: accessToken,
        body: {"phone_number": phoneNumber}
      );
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<void> postAppFeedback({String? accessToken, required String feedback}) async {
    try {
      await service.request(
        method: HttpMethod.post,
        appLabel: "request",
        endpoint: accessToken.isNull ? "app_feedback/guest_feedback/" : "app_feedback/user_feedback/",
        accessToken: accessToken,
        body: {"feedback": feedback}
      );
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}