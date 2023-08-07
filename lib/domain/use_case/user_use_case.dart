import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case/get_grades.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';

abstract class UserUseCase {
  Future<({bool isUserExist, String accessToken})> kakaoLogin({required String accessToken});
  Future<({String accessToken, String refreshToken, User user})> kakaoLoginFinish({required String accessToken});
  Future<User> getUser({required String accessToken});
  Future<Grades> getGrades();
  Future<String> validateNickname({required String nickname});
}

class UserUseCaseImpl extends BaseUseCase implements UserUseCase {
  final TokenRepository tokenRepository;
  final UserRepository userRepository;

  UserUseCaseImpl({required this.tokenRepository, required this.userRepository});

  @override
  Future<({String accessToken, bool isUserExist})> kakaoLogin({required String accessToken}) async {
    try{
        KakaoLoginCallbackResponse response = await userRepository.kakaoLogin(accessToken: accessToken);
        return (accessToken: response.access_token, isUserExist: response.user_exists);
    } on ErrorWithMessage{
      rethrow;
    }
  }

  @override
  Future<({String accessToken, String refreshToken, User user})> kakaoLoginFinish({required String accessToken}) async {
    try{
      LoginResponse response = await userRepository.kakaoLoginFinish(accessToken: accessToken);
      return (accessToken: response.access, refreshToken: response.refresh, user: parseUserFromUserResponse(response.user));
    } on ErrorWithMessage{
      rethrow;
    }
  }

  @override
  Future<User> getUser({required String accessToken}) async {
    try{
      return parseUserFromUserResponse(
          await userRepository.fetchUser(accessToken: accessToken));
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try {
        return parseUserFromUserResponse(
            await userRepository.fetchUser(accessToken: newToken));
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    }on RefreshTokenExpired{
      rethrow;
    }on ErrorWithMessage{
      rethrow;
    }
  }

  @override
  Future<Grades> getGrades() async {
    final f = GetGrades();
    try {
      return await f(userRepository: userRepository);
    }on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<String> validateNickname({required String nickname}) async {
    try {
      NicknameResponse res = await userRepository.validateNickname(nickname: nickname);
      return res.nickname;
    }on ErrorWithMessage {
      rethrow;
    }
  }
}