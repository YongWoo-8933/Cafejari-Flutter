import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/data/repository/util.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// user repository의 구현부
class UserRepositoryImpl implements UserRepository {
  APIService apiService;

  UserRepositoryImpl(this.apiService);

  final String boxLabel = "local";
  final String isInstalledFirstTimeKey = "isInstalledFirstTime";

  // LOCAL
  @override
  Future<bool> getIsInstalledFirstTime() async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    return await box.get(isInstalledFirstTimeKey) ?? true;
  }

  @override
  putIsInstalledFirstTime(bool isInstalled) async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    await box.put(isInstalledFirstTimeKey, isInstalled);
  }

  // REMOTE
  @override
  Future<Grades> fetchGrade() async {
    try {
      List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "user",
        endpoint: "grade/"
      );
      final res = response.map((dynamic e) => GradeResponse.fromJson(e)).toList();
      return res.map((gradeResponse) {
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
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<User> fetchUser({required String accessToken}) async {
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "user",
        endpoint: "user/",
        accessToken: accessToken
      );
      final res = UserResponse.fromJson(response);
      return parseUserFromUserResponse(res);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<String> validateNickname({required String nickname}) async {
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "user",
        endpoint: "profile/validate_nickname/",
        query: {"nickname": nickname}
      );
      return NicknameResponse.fromJson(response).nickname;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<String> autoGenerateNickname() async {
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "user",
        endpoint: "profile/auto_generate_nickname/"
      );
      return NicknameResponse.fromJson(response).nickname;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<ProfileImage>> fetchProfileImage() async {
    try {
      List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "user",
        endpoint: "profile_image/"
      );
      final res = response.map((dynamic e) => ProfileImageResponse.fromJson(e)).toList();
      return res.map((e) => (profileImageId: e.id, imageUrl: e.image)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  // POST
  @override
  Future<KakaoLogin> kakaoLogin({required String accessToken}) async {
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.post,
        appLabel: "user",
        endpoint: "kakao/login/callback/",
        body: {"access_token": accessToken}
      );
      final res = KakaoLoginCallbackResponse.fromJson(response);
      if(res.is_inactive) throw ErrorWithMessage(code: 0, message: '탈퇴 처리중인 계정입니다. 취소하려면 1:1문의를 통해 문의해주세요');
      return (accessToken: res.access_token, isUserExist: res.user_exists);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<KakaoLoginFinish> kakaoLoginFinish({required String accessToken}) async {
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.post,
        appLabel: "user",
        endpoint: "kakao/login/finish/",
        body: {"access_token": accessToken}
      );
      final res = LoginResponse.fromJson(response);
      return (accessToken: res.access, refreshToken: res.refresh, user: parseUserFromUserResponse(res.user));
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<AppleLogin> appleLogin({required String idToken, required String code}) async {
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.post,
        appLabel: "user",
        endpoint: "apple/login/callback/",
        body: {"id_token": idToken, "code": code}
      );
      final res = AppleLoginCallbackResponse.fromJson(response);
      if(res.is_inactive) throw ErrorWithMessage(code: 0, message: '탈퇴 처리중인 계정입니다. 취소하려면 1:1문의를 통해 문의해주세요');
      return (idToken: res.id_token, code: res.code, isUserExist: res.user_exists);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<AppleLoginFinish> appleLoginFinish({required String idToken, required String code}) async {
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.post,
        appLabel: "user",
        endpoint: "apple/login/finish/",
        body: {"id_token": idToken, "code": code}
      );
      final res = LoginResponse.fromJson(response);
      return (accessToken: res.access, refreshToken: res.refresh, user: parseUserFromUserResponse(res.user));
    } on ErrorWithMessage {
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
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.post,
        appLabel: "user",
        endpoint: "$userId/make_new_profile/",
        accessToken: accessToken,
        body: {
          "nickname": nickname,
          "profile_image_id": profileImageId,
          "fcm_token": fcmToken,
          "marketing_push_enabled": marketingPushEnabled
        }
      );
      final res = UserResponse.fromJson(response);
      return parseUserFromUserResponse(res);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
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
  }) async {
    Map<String, dynamic> requestBody = {};
    if (nickname.isNotNull) requestBody["nickname"] = nickname!;
    if (ageRange.isNotNull) requestBody["age_range"] = ageRange!;
    if (dateOfBirth.isNotNull) requestBody["date_of_birth"] = dateOfBirth!;
    if (phoneNumber.isNotNull) requestBody["phone_number"] = phoneNumber!;
    if (fcmToken.isNotNull) requestBody["fcm_token"] = fcmToken!;
    if (gender.isNotNull) requestBody["gender"] = gender!;
    if (profileImageId.isNotNull) requestBody["profile_image_id"] = profileImageId!;
    if (marketingPushEnabled.isNotNull) requestBody["marketing_push_enabled"] = marketingPushEnabled!;
    if (occupancyPushEnabled.isNotNull) requestBody["occupancy_push_enabled"] = occupancyPushEnabled!;
    if (logPushEnabled.isNotNull) requestBody["log_push_enabled"] = logPushEnabled!;
    if (favoriteCafeIdList.isNotNull) requestBody["favorite_cafe_id_list"] = favoriteCafeIdList!;
    if (openness.isNotNull) requestBody["cati_openness"] = openness!;
    if (coffee.isNotNull) requestBody["cati_coffee"] = coffee!;
    if (workspace.isNotNull) requestBody["cati_workspace"] = workspace!;
    if (acidity.isNotNull) requestBody["cati_acidity"] = acidity!;
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.put,
        appLabel: "user",
        endpoint: "profile/$profileId/",
        accessToken: accessToken,
        body: requestBody
      );
      final res = UserResponse.fromJson(response);
      return parseUserFromUserResponse(res);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<void> logout({required String accessToken, required String refreshToken}) async {
    try {
      await apiService.request(
        method: HttpMethod.post,
        appLabel: "user",
        endpoint: "logout/",
        accessToken: accessToken,
        body: {"refresh": refreshToken}
      );
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}