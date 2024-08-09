import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/challenge/challenge_response.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/data/repository/util.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/domain/repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// challenge repository의 구현부
class ChallengeRepositoryImpl implements ChallengeRepository {
  APIService apiService;
  final String boxLabel = "local";
  final String lastViewedChallengeIdKey = "lastViewedChallengeIdKey";

  ChallengeRepositoryImpl(this.apiService);

  // LOCAL
  @override
  Future<int> getLastViewedChallengeId() async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    return await box.get(lastViewedChallengeIdKey) ?? 0;
  }

  @override
  putLastViewedChallengeId(int id) async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    await box.put(lastViewedChallengeIdKey, id);
  }

  // REMOTE
  @override
  Future<Challenges> fetchChallenges() async {
    try {
      List<dynamic> challengeResponse = await apiService.request(
        method: HttpMethod.get,
        appLabel: "challenge",
        endpoint: ""
      );
      List<dynamic> imageResponse = await apiService.request(
        method: HttpMethod.get,
        appLabel: "user",
        endpoint: "profile_image/"
      );
      List<ChallengeResponse> challengeResponseList = challengeResponse.map((dynamic e) => ChallengeResponse.fromJson(e)).toList();
      List<ProfileImageResponse> profileImages = imageResponse.map((dynamic e) => ProfileImageResponse.fromJson(e)).toList();
      return challengeResponseList.map((e) => parseChallengeFromChallengeResponse(
        challengeResponse: e,
        challengerProfileImages: profileImages.map((e) => e.image).toList()
      )).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Challengers> fetchMyChallengers({required String accessToken}) async {
    try {
      List<dynamic> challengerResponse = await apiService.request(
        method: HttpMethod.get,
        appLabel: "challenge",
        endpoint: "challenger/",
        accessToken: accessToken
      );
      List<dynamic> imageResponse = await apiService.request(
          method: HttpMethod.get,
          appLabel: "user",
          endpoint: "profile_image/"
      );
      List<ChallengerResponse> challengerResponseList = challengerResponse.map((dynamic e) => ChallengerResponse.fromJson(e)).toList();
      List<ProfileImageResponse> profileImages = imageResponse.map((dynamic e) => ProfileImageResponse.fromJson(e)).toList();
      return challengerResponseList.map((challengerResponse) {
        return Challenger(
          id: challengerResponse.id,
          count: challengerResponse.count,
          progressRate: double.parse(challengerResponse.progress_rate),
          challenge: parseChallengeFromChallengeResponse(
            challengeResponse: challengerResponse.challenge,
            challengerProfileImages: profileImages.map((e) => e.image).toList()
          ),
          points: challengerResponse.challenge_point.map((challengePointResponse) {
            return ChallengePoint(
              id: challengePointResponse.id,
              point: challengePointResponse.point,
              description: challengePointResponse.description,
              rewardedAt: DateTime.parse(challengePointResponse.rewarded_at));
            }).toList());
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  // POST
  @override
  Future<Challenge> participate({required String accessToken, required int challengeId}) async {
    try {
      dynamic challengeResponse = await apiService.request(
        method: HttpMethod.post,
        appLabel: "challenge",
        endpoint: "participate/",
        accessToken: accessToken,
        body: {"challenge_id": challengeId}
      );
      List<dynamic> imageResponse = await apiService.request(
        method: HttpMethod.get,
        appLabel: "user",
        endpoint: "profile_image/"
      );
      ChallengeResponse challengeRes = ChallengeResponse.fromJson(challengeResponse);
      List<ProfileImageResponse> profileImages = imageResponse.map((dynamic e) => ProfileImageResponse.fromJson(e)).toList();
      return parseChallengeFromChallengeResponse(
        challengeResponse: challengeRes,
        challengerProfileImages: profileImages.map((e) => e.image).toList()
      );
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}