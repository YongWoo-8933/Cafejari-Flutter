import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/challenge/challenge_response.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// challenge application api와 통신하는 저장소
abstract class ChallengeRepository {
  // LOCAL
  Future<int> getLastViewedChallengeId();
  putLastViewedChallengeId(int id);
  // GET
  Future<List<ChallengeResponse>> fetchChallenges();
  Future<List<ChallengerResponse>> fetchMyChallengers({required String accessToken});
  // POST
  Future<ChallengeResponse> participate({
    required String accessToken,
    required int challengeId,
  });
}

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

  // GET
  @override
  Future<List<ChallengeResponse>> fetchChallenges() async {
    try {
      List<dynamic> response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "challenge",
          endpoint: ""
      );
      return response.map((dynamic e) => ChallengeResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<ChallengerResponse>> fetchMyChallengers({required String accessToken}) async {
    try {
      List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "challenge",
        endpoint: "challenger/",
        accessToken: accessToken
      );
      return response.map((dynamic e) => ChallengerResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  // POST
  @override
  Future<ChallengeResponse> participate({required String accessToken, required int challengeId}) async {
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.post,
        appLabel: "challenge",
        endpoint: "participate/",
        accessToken: accessToken,
        body: {"challenge_id": challengeId}
      );
      return ChallengeResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}