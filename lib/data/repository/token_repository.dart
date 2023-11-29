import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';

/// access token, refresh token 관리 저장소
abstract interface class TokenRepository {
  Future<TokenResponse> fetchAccessToken();
  Future<void> putRefreshToken({required String newToken});
  Future<String> getRefreshToken();
}

/// user repository의 구현부
class TokenRepositoryImpl implements TokenRepository {
  final APIService service;
  final String boxLabel = "local";
  final String refreshTokenKey = "refreshToken";

  TokenRepositoryImpl(this.service);

  @override
  Future<TokenResponse> fetchAccessToken() async {
    try {
      final Box<dynamic> box = await Hive.openBox(boxLabel);
      String? refreshToken = await box.get(refreshTokenKey);
      if (refreshToken.isNull) throw RefreshTokenExpired();
      return TokenResponse.fromJson(await service.request(
          method: HttpMethod.post,
          appLabel: "user",
          endpoint: "token/refresh/",
          body: {"refresh": refreshToken}));
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw RefreshTokenExpired();
    }
  }

  @override
  Future<void> putRefreshToken({required String newToken}) async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    await box.put(refreshTokenKey, newToken);
  }

  @override
  Future<String> getRefreshToken() async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    return await box.get(refreshTokenKey);
  }
}
