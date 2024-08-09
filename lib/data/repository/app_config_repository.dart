import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/app_config/app_config_response.dart';
import 'package:cafejari_flutter/domain/entity/app_config/app_config.dart';
import 'package:cafejari_flutter/domain/repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// app_config repository의 구현부
class AppConfigRepositoryImpl implements AppConfigRepository {
  final String boxLabel = "local";
  final String isInstalledFirstTimeKey = "isInstalledFirstTime";
  final String isReviewSubmittedKey = "IsReviewSubmitted";
  final String isFlagButtonTappedKey = "isFlagButtonTapped";
  final String lastPopUpTimeKey = "lastPopUpTime";

  APIService apiService;

  AppConfigRepositoryImpl(this.apiService);

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

  @override
  Future<bool> getIsReviewSubmitted() async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    return await box.get(isReviewSubmittedKey) ?? false;
  }

  @override
  putIsReviewSubmitted(bool isSubmitted) async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    await box.put(isReviewSubmittedKey, isSubmitted);
  }

  @override
  Future<bool> getIsFlagButtonTapped() async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    return await box.get(isFlagButtonTappedKey) ?? false;
  }

  @override
  putIsFlagButtonTapped(bool isTapped) async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    await box.put(isFlagButtonTappedKey, isTapped);
  }

  @override
  Future<DateTime> getLastPopUpTime() async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    return await box.get(lastPopUpTimeKey) ?? DateTime(2022);
  }

  @override
  putLastPopUpTime(DateTime datetime) async {
    final Box<dynamic> box = await Hive.openBox(boxLabel);
    await box.put(lastPopUpTimeKey, datetime);
  }

  // REMOTE
  @override
  Future<Versions> fetchVersion() async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "app_config",
        endpoint: "version/",
      );
      final List<VersionResponse> responses = response.map((e) => VersionResponse.fromJson(e)).toList();
      return responses.map((e) {
        return Version(
            major: e.major,
            minor: e.minor,
            patch: e.patch,
            updatedAt: DateTime.parse(e.updated_at),
            description: e.description
        );
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }
}

