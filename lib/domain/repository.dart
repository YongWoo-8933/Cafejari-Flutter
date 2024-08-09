import 'package:cafejari_flutter/domain/entity/app_config/app_config.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/domain/entity/request/request.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';


/// app_config(기본 설정) 데이터 repository의 interface
abstract interface class AppConfigRepository {
  // LOCAL
  Future<bool> getIsInstalledFirstTime();
  putIsInstalledFirstTime(bool isInstalled);
  Future<bool> getIsReviewSubmitted();
  putIsReviewSubmitted(bool isSubmitted);
  Future<bool> getIsFlagButtonTapped();
  putIsFlagButtonTapped(bool isTapped);
  Future<DateTime> getLastPopUpTime();
  putLastPopUpTime(DateTime datetime);
  // REMOTE
  Future<Versions> fetchVersion();
}

/// cafe application api와 통신하는 repository의 interface
abstract interface class CafeRepository {
  // REMOTE
  Future<Cafes> fetchMapCafe({required double latitude, required double longitude, required int zoomLevel});
  Future<Cafe> retrieveCafe({required int cafeId});
  Future<Cafes> fetchSearchCafe({required String query, double? latitude, double? longitude});
  Future<Cafes> fetchRecommendedCafe({required double latitude, required double longitude});
  Future<OccupancyRateUpdates> fetchMyOccupancyUpdate({required String accessToken});
  Future<Map<int, OccupancyRateUpdates>> fetchMyTodayOccupancyUpdate({required String accessToken});
  Future<NaverSearchCafes> fetchNaverSearchResult({required String query});
  Future<Locations> fetchLocation();
  Future<OccupancyRateUpdate> postOccupancyRateAsUser(
      {required String accessToken,
        required double occupancyRate,
        required int cafeFloorId});
  Future<OccupancyRateUpdate> postOccupancyRateAsGuest(
      {required double occupancyRate,
        required int cafeFloorId});
  Future<void> postCATI(
    {required String accessToken,
      required int cafeId,
      required int openness,
      required int coffee,
      required int workspace,
      required int acidity});
}

/// challenge application api와 통신하는 repository의 interface
abstract class ChallengeRepository {
  // LOCAL
  Future<int> getLastViewedChallengeId();
  putLastViewedChallengeId(int id);
  // REMOTE
  Future<Challenges> fetchChallenges();
  Future<Challengers> fetchMyChallengers({required String accessToken});
  Future<Challenge> participate({required String accessToken, required int challengeId});
}

/// leader application api와 통신하는 repository의 interface
abstract class LeaderboardRepository {
  // REMOTE
  Future<PartialUsers> fetchMonthRanker();
  Future<PartialUsers> fetchWeekRanker();
  Future<PartialUsers> fetchTotalRanker();
}

/// push application api와 통신하는 repository의 interface
abstract interface class PushRepository {
  // REMOTE
  Future<PopUps> fetchPopUp();
  Future<Pushes> fetchMyPush({required String accessToken});
  Future<Push> readPush({required String accessToken, required int pushId});
}

/// request application api와 통신하는 repository의 interface
abstract interface class RequestRepository {
  // REMOTE
  Future<CafeAdditionRequest> postCafeAdditionRequest({
    required String accessToken,
    required String cafeName,
    required String dongAddress,
    required String roadAddress,
    required double latitude,
    required double longitude,
    required int topFloor,
    required int bottomFloor,
    required List<double> wallSocketRateList,
    required List<String> openingHourList,
    required String etc
  });
  Future<CafeModificationRequest> postCafeModificationRequest({
    required String accessToken,
    required bool isClosed,
    required int cafeId,
    required int topFloor,
    required int bottomFloor,
    List<double>? wallSocketRateList,
    List<String>? openingHourList,
    List<String>? restRoomList,
    double? latitude,
    double? longitude,
    String? etc
  });
  Future<void> postUserWithdrawalRequest({required String accessToken, required String reason});
  Future<void> postUserMigrationRequest({required String accessToken, required String phoneNumber});
  Future<void> postAppFeedback({String? accessToken, required String feedback});
}

/// shop application api와 통신하는 repository의 interface
abstract interface class ShopRepository {
  // REMOTE
  Future<Brands> fetchBrand();
  Future<Items> fetchItem();
  Future<Brandcons> fetchMyBrandcon({required String accessToken});
  Future<Brandcon> postBrandcon({required String accessToken, required int itemId});
  Future<Brandcon> updateBrandcon({required String accessToken, required int brandconId, bool? isUsed});
  Future<void> deleteBrandcon({required String accessToken, required int brandconId});
}

/// access token, refresh token 데이터 repository의 interface
abstract interface class TokenRepository {
  // LOCAL
  Future<void> putRefreshToken({required String newToken});
  Future<String> getRefreshToken();
  // REMOTE
  Future<String> fetchAccessToken();
}

typedef ProfileImage = ({int profileImageId, String imageUrl});
typedef KakaoLogin = ({bool isUserExist, String accessToken});
typedef KakaoLoginFinish = ({String accessToken, String refreshToken, User user});
typedef AppleLogin = ({bool isUserExist, String idToken, String code});
typedef AppleLoginFinish = ({String accessToken, String refreshToken, User user});

/// user application api와 통신하는 repository의 interface
abstract class UserRepository {
  // LOCAL
  Future<bool> getIsInstalledFirstTime();
  putIsInstalledFirstTime(bool isInstalled);
  // REMOTE
  Future<Grades> fetchGrade();
  Future<String> validateNickname({required String nickname});
  Future<String> autoGenerateNickname();
  Future<User> fetchUser({required String accessToken});
  Future<List<ProfileImage>> fetchProfileImage();
  Future<KakaoLogin> kakaoLogin({required String accessToken});
  Future<KakaoLoginFinish> kakaoLoginFinish({required String accessToken});
  Future<AppleLogin> appleLogin({required String idToken, required String code});
  Future<AppleLoginFinish> appleLoginFinish({required String idToken, required String code});
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
    int? openness,
    int? coffee,
    int? workspace,
    int? acidity,
  });
  Future<void> logout({required String accessToken, required String refreshToken});
}