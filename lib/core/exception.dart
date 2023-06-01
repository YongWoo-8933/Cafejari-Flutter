
/// 에러의 원인을 message 생성자로 가지는 exception
class ErrorWithMessage implements Exception {
  final String message;
  ErrorWithMessage(this.message);
}

/// access or refresh token이 만료 or 잘못됨
class TokenExpired implements Exception {}

/// access token이 만료 or 잘못됨
class AccessTokenExpired implements Exception {}

/// refresh token이 만료 or 잘못됨
class RefreshTokenExpired implements Exception {}

/// 혼잡도 공유 활동이 자동 만료됨
class CrowdedSharingAutoExpired implements Exception {}