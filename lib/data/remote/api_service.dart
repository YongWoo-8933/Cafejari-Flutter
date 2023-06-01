import 'dart:convert';

import 'package:http/http.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/data/remote/dto/error/error_response.dart';

/// Http 통신을 수행 하는 Service class
class APIService {
  final String _baseUrl = "cafejari.software";

  /// 일반적인 http 통신 요청 함수로,
  /// 응답 성공시 decoded json형태를 반환
  /// [method]는 HttpMethod enum값을,
  /// [appLabel]은 통신 앱 point를,
  /// [endpoint]는 url endpoint를,
  /// [accessToken]은 필요한 경우에만 기입,
  /// [body]는 post, put등에만 Map 타입으로 작성,
  /// [query]는 get의 query parameter가 들어갈때 Map타입으로 작성한다.
  Future<dynamic> request(
      {required HttpMethod method,
      required String appLabel,
      required String endpoint,
      String? accessToken,
      Map<String, dynamic>? body,
      Map<String, dynamic>? query}) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    if (accessToken.isNotNull) headers["Authorization"] = "Bearer $accessToken";
    final stringQuery = query?.map((key, value) => MapEntry(key, value.toString()));

    Response response = switch(method) {
      HttpMethod.get => await get(
        Uri.https(_baseUrl, "/$appLabel/$endpoint", stringQuery),
        headers: headers,
      ),
      HttpMethod.post => await post(
        Uri.https(_baseUrl, "/$appLabel/$endpoint"),
        headers: headers,
        body: body
      ),
      HttpMethod.put => await put(
        Uri.https(_baseUrl, "/$appLabel/$endpoint"),
        headers: headers,
          body: body
      ),
      HttpMethod.delete => await delete(
        Uri.https(_baseUrl, "/$appLabel/$endpoint"),
        headers: headers,
      )
    };

    if (response.statusCode < 300) {
      // 200번대 (성공)
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else if (response.statusCode < 500) {
      // 400, 300번대 에러
      switch (response.statusCode) {
        case 400:
          // validation 에러
          ValidationErrorResponse errorResponse =
              ValidationErrorResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
          String errorMessage = "";
          if (errorResponse.non_field_errors.isNotNull) {
            errorResponse.non_field_errors?.forEach((msg) => errorMessage += "$msg\n");
          }
          if (errorResponse.nickname.isNotNull) {
            errorResponse.nickname?.forEach((msg) => errorMessage += "$msg\n");
          }
          if (errorResponse.phone_number.isNotNull) {
            errorResponse.phone_number?.forEach((msg) => errorMessage += "$msg\n");
          }
          throw ErrorWithMessage(errorMessage);
        case 401:
          // 토큰 불량 / 만료 에러
          throw TokenExpired();
        case 409:
          // 서비스 로직 에러
          ConflictErrorResponse errorResponse =
              ConflictErrorResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
          switch (errorResponse.error_code) {
            case 100:
              throw ErrorWithMessage("이미 다른 사람이 활동중 입니다");
            case 101:
              throw CrowdedSharingAutoExpired();
            case 102:
              final time = errorResponse.detail.isNotNull ? "(${errorResponse.detail})" : "";
              throw ErrorWithMessage("혼잡도 공유 활동 제한 시간 입니다 $time");
            case 200:
              throw ErrorWithMessage("자신의 활동은 추천할 수 없습니다");
            case 201:
              throw ErrorWithMessage("이미 추천한 활동입니다");
            case 202:
              throw ErrorWithMessage("활동에 대한 추천은 3회 까지 가능 합니다");
            case 400:
              final caution = errorResponse.detail.isNotNull ? ": ${errorResponse.detail}" : "";
              throw ErrorWithMessage("구글 로그인 에러 $caution");
            case 401:
              final socialType = errorResponse.detail.isNotNull ? "(${errorResponse.detail})" : "";
              throw ErrorWithMessage("소셜 로그인 에러 $socialType");
            case 402:
              throw ErrorWithMessage("카카오 계정에 등록된 이메일이 없습니다. 이메일 등록 후 진행해 주세요");
            case 403:
              throw ErrorWithMessage("해당 번호는 이미 가입 되어 있습니다");
            case 404:
              throw ErrorWithMessage("인증 번호를 먼저 전송해 주세요");
            case 405:
              throw ErrorWithMessage("인증 번호 전송 후 3분이 초과 되었습니다. 다시 진행해 주세요");
            case 406:
              throw ErrorWithMessage("인증 번호가 일치하지 않습니다");
            case 407:
              throw ErrorWithMessage("메세지 전송 에러");
            case 411:
              throw ErrorWithMessage("추천인에 닉네임이 존재하지 않습니다");
            default:
              throw ErrorWithMessage("내부 서버 에러");
          }
        default:
          // 이외 400번대 에러
          throw ErrorWithMessage("원인 모를 에러 발생");
      }
    } else if (response.statusCode < 600) {
      // 500번대 서버 에러
      throw ErrorWithMessage("내부 서버 에러");
    } else {
      // 놓친 에러
      throw ErrorWithMessage("원인 모를 에러 발생, 앱을 재시작해보세요");
    }
  }
}

/// http 통신 method
enum HttpMethod { get, post, put, delete }
