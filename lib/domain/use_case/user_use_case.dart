import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/data/repository/request_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case/make_new_profile.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';

abstract class UserUseCase {
  putRefreshToken(String token);
  Future<({bool isUserExist, String accessToken})> kakaoLogin({required String accessToken});
  Future<({String accessToken, String refreshToken, User user})> kakaoLoginFinish({required String accessToken});
  Future<({bool isUserExist, String idToken, String code})> appleLogin({required String idToken, required String code});
  Future<({String accessToken, String refreshToken, User user})> appleLoginFinish({required String idToken, required String code});
  Future<User> getUser({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  });
  Future<Grades> getGrades();
  Future<String> validateNickname({required String nickname});
  Future<String> autoGenerateNickname();
  Future<List<({int profileImageId, String imageUrl})>> getDefaultProfileImages();
  Future<User> makeNewProfile({
    required String accessToken,
    required String fcmToken,
    required String nickname,
    required int userId,
    required int profileImageId,
    required bool marketingPushEnabled,
    required Function(String) onAccessTokenRefresh
  });
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
  });
  Future<void> logout({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  });
  Future<void> withdraw({
    required String accessToken,
    required String reason,
    required Function(String) onAccessTokenRefresh
  });
  Future<void> userMigrate({
    required String accessToken,
    required String phoneNumber,
    required Function(String) onAccessTokenRefresh
  });
  Future<void> appFeedback({
    String? accessToken,
    required String feedback,
    required Function(String) onAccessTokenRefresh
  });
}

class UserUseCaseImpl extends BaseUseCase implements UserUseCase {
  final TokenRepository tokenRepository;
  final UserRepository userRepository;
  final RequestRepository requestRepository;

  UserUseCaseImpl({required this.tokenRepository, required this.userRepository, required this.requestRepository});


  @override
  putRefreshToken(String token) async => await tokenRepository.putRefreshToken(newToken: token);

  @override
  Future<({String accessToken, bool isUserExist})> kakaoLogin({required String accessToken}) async {
    try{
      KakaoLoginCallbackResponse response = await userRepository.kakaoLogin(accessToken: accessToken);
      if(response.is_inactive) throw ErrorWithMessage(code: 0, message: '탈퇴 처리중인 계정입니다. 취소하려면 1:1문의를 통해 문의해주세요');
      return (accessToken: response.access_token, isUserExist: response.user_exists);
    } on ErrorWithMessage {
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
  Future<({String idToken, String code, bool isUserExist})> appleLogin({required String idToken, required String code}) async {
    try {
      AppleLoginCallbackResponse response = await userRepository.appleLogin(idToken: idToken, code: code);
      if(response.is_inactive) throw ErrorWithMessage(code: 0, message: '탈퇴 처리중인 계정입니다. 취소하려면 1:1문의를 통해 문의해주세요');
      return (idToken: response.id_token, code: response.code, isUserExist: response.user_exists);
    } on ErrorWithMessage{
      rethrow;
    }
  }

  @override
  Future<({String accessToken, String refreshToken, User user})> appleLoginFinish({required String idToken, required String code}) async {
    try{
      LoginResponse response = await userRepository.appleLoginFinish(idToken: idToken, code: code);
      return (accessToken: response.access, refreshToken: response.refresh, user: parseUserFromUserResponse(response.user));
    } on ErrorWithMessage{
      rethrow;
    }
  }

  @override
  Future<User> getUser({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    try{
      return parseUserFromUserResponse(
          await userRepository.fetchUser(accessToken: accessToken));
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        return parseUserFromUserResponse(
            await userRepository.fetchUser(accessToken: newToken));
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    } on ErrorWithMessage{
      rethrow;
    }
  }

  @override
  Future<Grades> getGrades() async {
    try {
      List<GradeResponse> gradeResponseList = await userRepository.fetchGrade();
      return gradeResponseList.map((gradeResponse) {
        return Grade(
            id: gradeResponse.id,
            step: gradeResponse.step,
            updateCountRequirement: gradeResponse.sharing_count_requirement,
            updateRestrictionPerCafe: gradeResponse.sharing_restriction_per_cafe,
            stackRestrictionPerDay: gradeResponse.activity_stack_restriction_per_day,
            name: gradeResponse.name,
            imageUrl: gradeResponse.image ?? Grade.empty().imageUrl,
            description: gradeResponse.description ?? Grade.empty().description
        );
      }).toList();
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

  @override
  Future<String> autoGenerateNickname() async {
    try {
      NicknameResponse res = await userRepository.autoGenerateNickname();
      return res.nickname;
    }on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<({int profileImageId, String imageUrl})>> getDefaultProfileImages() async {
    try {
      List<ProfileImageResponse> profileImageResponseList = await userRepository.fetchProfileImage();
      return profileImageResponseList.map((e) => (profileImageId: e.id, imageUrl: e.image)).toList();
    }on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<User> makeNewProfile({
    required String accessToken,
    required String fcmToken,
    required String nickname,
    required int userId,
    required int profileImageId,
    required bool marketingPushEnabled,
    required Function(String) onAccessTokenRefresh
  }) async {
    final f = MakeNewProfile();
    try {
      return await f(
        userRepository: userRepository,
        accessToken: accessToken,
        fcmToken: fcmToken,
        nickname: nickname,
        userId: userId,
        profileImageId: profileImageId,
        marketingPushEnabled: marketingPushEnabled
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        return await f(
          userRepository: userRepository,
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

  @override
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
      final UserResponse userRes = await userRepository.updateProfile(
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
      return parseUserFromUserResponse(userRes);
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        final UserResponse userRes = await userRepository.updateProfile(
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
        return parseUserFromUserResponse(userRes);
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    } on ErrorWithMessage{
      rethrow;
    }
  }

  @override
  Future<void> logout({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    final String refreshToken = await tokenRepository.getRefreshToken();
    try {
      await userRepository.logout(accessToken: accessToken, refreshToken: refreshToken);
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
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

  @override
  Future<void> withdraw({
    required String accessToken,
    required String reason,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      await requestRepository.postUserWithdrawalRequest(accessToken: accessToken, reason: reason);
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
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

  @override
  Future<void> userMigrate({
    required String accessToken,
    required String phoneNumber,
    required Function(String) onAccessTokenRefresh
  }) async {
    final replacedPhoneNumber = phoneNumber.replaceFirst("010", "");
    try {
      await requestRepository.postUserMigrationRequest(accessToken: accessToken, phoneNumber: replacedPhoneNumber);
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        await requestRepository.postUserMigrationRequest(accessToken: accessToken, phoneNumber: replacedPhoneNumber);
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    } on ErrorWithMessage{
      rethrow;
    }
  }

  @override
  Future<void> appFeedback({
    String? accessToken,
    required String feedback,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      await requestRepository.postAppFeedback(accessToken: accessToken, feedback: feedback);
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
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