import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/repository.dart';


class UserUseCase {
  final TokenRepository tokenRepository;
  final UserRepository userRepository;
  final RequestRepository requestRepository;

  UserUseCase({required this.tokenRepository, required this.userRepository, required this.requestRepository});

  // LOCAL
  Future<bool> getIsInstalledFirstTime() async => await userRepository.getIsInstalledFirstTime();

  setIsInstalledFirstTime(bool isInstalled) async => await userRepository.putIsInstalledFirstTime(isInstalled);

  putRefreshToken(String token) async => await tokenRepository.putRefreshToken(newToken: token);

  // REMOTE
  Future<KakaoLogin> kakaoLogin({required String accessToken}) async {
    try {
      return await userRepository.kakaoLogin(accessToken: accessToken);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<KakaoLoginFinish> kakaoLoginFinish({required String accessToken}) async {
    try{
      return await userRepository.kakaoLoginFinish(accessToken: accessToken);
    } on ErrorWithMessage{
      rethrow;
    }
  }

  Future<AppleLogin> appleLogin({required String idToken, required String code}) async {
    try {
      return await userRepository.appleLogin(idToken: idToken, code: code);
    } on ErrorWithMessage{
      rethrow;
    }
  }

  Future<AppleLoginFinish> appleLoginFinish({required String idToken, required String code}) async {
    try{
      return await userRepository.appleLoginFinish(idToken: idToken, code: code);
    } on ErrorWithMessage{
      rethrow;
    }
  }

  Future<User> getUser({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await userRepository.fetchUser(accessToken: accessToken);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await userRepository.fetchUser(accessToken: newToken);
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    } on ErrorWithMessage{
      rethrow;
    }
  }

  Future<Grades> getGrades() async {
    try {
      return await userRepository.fetchGrade();
    }on ErrorWithMessage {
      rethrow;
    }
  }

  Future<String> validateNickname({required String nickname}) async {
    try {
      return await userRepository.validateNickname(nickname: nickname);
    }on ErrorWithMessage {
      rethrow;
    }
  }

  Future<String> autoGenerateNickname() async {
    try {
      return await userRepository.autoGenerateNickname();
    }on ErrorWithMessage {
      rethrow;
    }
  }

  Future<List<ProfileImage>> getDefaultProfileImages() async {
    try {
      return await userRepository.fetchProfileImage();
    }on ErrorWithMessage {
      rethrow;
    }
  }

  Future<User> makeNewProfile({
    required String accessToken,
    required String fcmToken,
    required String nickname,
    required int userId,
    required int profileImageId,
    required bool marketingPushEnabled,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await userRepository.makeNewProfile(
        accessToken: accessToken,
        fcmToken: fcmToken,
        nickname: nickname,
        userId: userId,
        profileImageId: profileImageId,
        marketingPushEnabled: marketingPushEnabled
      );
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await userRepository.makeNewProfile(
          accessToken: newToken,
          fcmToken: fcmToken,
          nickname: nickname,
          userId: userId,
          profileImageId: profileImageId,
          marketingPushEnabled: marketingPushEnabled
        );
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    } on ErrorWithMessage{
      rethrow;
    }
  }

  Future<User> updateProfile({
    required String accessToken,
    required int profileId,
    String? nickname,
    String? ageRange,
    String? dateOfBirth,
    String? phoneNumber,
    String? fcmToken,
    int? gender,
    int? profileImageId,
    bool? marketingPushEnabled,
    bool? occupancyPushEnabled,
    bool? logPushEnabled,
    List<int>? favoriteCafeIdList,
    int? openness,
    int? coffee,
    int? workspace,
    int? acidity,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await userRepository.updateProfile(
        accessToken: accessToken,
        profileId: profileId,
        nickname: nickname,
        ageRange: ageRange,
        dateOfBirth: dateOfBirth,
        phoneNumber: phoneNumber,
        fcmToken: fcmToken,
        gender: gender,
        profileImageId: profileImageId,
        marketingPushEnabled: marketingPushEnabled,
        occupancyPushEnabled: occupancyPushEnabled,
        logPushEnabled: logPushEnabled,
        favoriteCafeIdList: favoriteCafeIdList,
        openness: openness,
        coffee: coffee,
        workspace: workspace,
        acidity: acidity
      );
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await userRepository.updateProfile(
          accessToken: newToken,
          profileId: profileId,
          nickname: nickname,
          ageRange: ageRange,
          dateOfBirth: dateOfBirth,
          phoneNumber: phoneNumber,
          fcmToken: fcmToken,
          gender: gender,
          profileImageId: profileImageId,
          marketingPushEnabled: marketingPushEnabled,
          occupancyPushEnabled: occupancyPushEnabled,
          logPushEnabled: logPushEnabled,
          favoriteCafeIdList: favoriteCafeIdList,
          openness: openness,
          coffee: coffee,
          workspace: workspace,
          acidity: acidity
        );
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    } on ErrorWithMessage{
      rethrow;
    }
  }

  Future<void> logout({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    final String refreshToken = await tokenRepository.getRefreshToken();
    try {
      await userRepository.logout(accessToken: accessToken, refreshToken: refreshToken);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        await userRepository.logout(accessToken: newToken, refreshToken: refreshToken);
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    } on ErrorWithMessage{
      rethrow;
    }
  }

  Future<void> withdraw({
    required String accessToken,
    required String reason,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      await requestRepository.postUserWithdrawalRequest(accessToken: accessToken, reason: reason);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        await requestRepository.postUserWithdrawalRequest(accessToken: newToken, reason: reason);
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    } on ErrorWithMessage{
      rethrow;
    }
  }

  Future<void> userMigrate({
    required String accessToken,
    required String phoneNumber,
    required Function(String) onAccessTokenRefresh
  }) async {
    final replacedPhoneNumber = phoneNumber.replaceFirst("010", "");
    try {
      await requestRepository.postUserMigrationRequest(accessToken: accessToken, phoneNumber: replacedPhoneNumber);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        await requestRepository.postUserMigrationRequest(accessToken: newToken, phoneNumber: replacedPhoneNumber);
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    } on ErrorWithMessage{
      rethrow;
    }
  }

  Future<void> appFeedback({
    String? accessToken,
    required String feedback,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      await requestRepository.postAppFeedback(accessToken: accessToken, feedback: feedback);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        await requestRepository.postAppFeedback(accessToken: newToken, feedback: feedback);
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    } on ErrorWithMessage{
      rethrow;
    }
  }
}