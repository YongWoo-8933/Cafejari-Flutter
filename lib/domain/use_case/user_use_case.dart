import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case/make_new_profile.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';

abstract class UserUseCase {
  Future<({bool isUserExist, String accessToken})> kakaoLogin({required String accessToken});
  Future<({String accessToken, String refreshToken, User user})> kakaoLoginFinish({required String accessToken});
  Future<User> getUser({required String accessToken});
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
    required bool marketingPushEnabled
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
  });
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
    required bool marketingPushEnabled
  }) async {
    final f = MakeNewProfile();
    try {
      return f(
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
      try {
        return f(
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
    List<int>? favoriteCafeIdList
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
        favoriteCafeIdList: favoriteCafeIdList
      );
      return parseUserFromUserResponse(userRes);
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
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
          favoriteCafeIdList: favoriteCafeIdList
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
}