import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/app_config/app_config_response.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe_log/cafe_log_response.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// app_config application api와 통신하는 저장소
abstract interface class AppConfigRepository {
  Future<List<VersionResponse>> fetchVersion();
}

/// app_config repository의 구현부
class AppConfigRepositoryImpl implements AppConfigRepository {
  APIService apiService;

  AppConfigRepositoryImpl(this.apiService);

  @override
  Future<List<VersionResponse>> fetchVersion() async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "app_config",
        endpoint: "version/",
      );
      return response.map((e) => VersionResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }
}

