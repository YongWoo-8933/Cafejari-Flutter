import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/data/remote/dto/error/error_response.dart';

/// Http 통신을 수행 하는 Service class
class APIService {
  final String _baseUrl = "cafejari.co.kr";

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

    try {
      Response response = switch(method) {
        HttpMethod.get => await get(
          Uri.https(_baseUrl, "/$appLabel/$endpoint", stringQuery),
          headers: headers,
        ),
        HttpMethod.post => await post(
            Uri.https(_baseUrl, "/$appLabel/$endpoint"),
            headers: headers,
            body: json.encode(body)
        ),
        HttpMethod.put => await put(
            Uri.https(_baseUrl, "/$appLabel/$endpoint"),
            headers: headers,
            body: json.encode(body)
        ),
        HttpMethod.delete => await delete(
          Uri.https(_baseUrl, "/$appLabel/$endpoint"),
          headers: headers,
        )
      };
      if (response.statusCode < 300) {
        // 200번대 (성공)
        if (response.body.isNotEmpty) return jsonDecode(utf8.decode(response.bodyBytes));
      } else if (response.statusCode < 500) {
        // 400, 300번대 에러
        switch (response.statusCode) {
          case 400:
          // validation 에러
            throw ErrorWithMessage(code: 0, message: "잘못된 요청입니다");
          case 401:
          // 토큰 불량 / 만료 에러
            throw TokenExpired();
          case 409:
          // 서비스 로직 에러
            ConflictErrorResponse errorResponse = ConflictErrorResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
            throw ErrorWithMessage(code: errorResponse.error_code, message: errorResponse.error_message);
          default:
          // 이외 400번대 에러
            throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생");
        }
      } else if (response.statusCode < 600) {
        // 500번대 서버 에러
        throw ErrorWithMessage(code: 0, message: "내부 서버 에러");
      } else {
        // 놓친 에러
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작해보세요");
      }
    } on SocketException {
      // 인터넷 연결 문제 예외 처리
      throw ErrorWithMessage(code: 0, message: "에러 발생. 인터넷 연결 상태를 확인하거나 앱을 재시작해보세요");
    }
  }
}

/// http 통신 method
enum HttpMethod { get, post, put, delete }