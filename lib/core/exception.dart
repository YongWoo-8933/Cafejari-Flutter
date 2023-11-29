
/// 에러의 원인을 code, message 생성자로 가지는 exception
class ErrorWithMessage implements Exception {
  final int code;
  final String message;
  ErrorWithMessage({required this.code, required this.message});
}

/// access or refresh token이 만료 or 잘못됨
class TokenExpired implements Exception {}

/// access token이 만료 or 잘못됨
class AccessTokenExpired implements Exception {}

/// refresh token이 만료 or 잘못됨
class RefreshTokenExpired implements Exception {}