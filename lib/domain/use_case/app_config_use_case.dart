import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/app_config/app_config_response.dart';
import 'package:cafejari_flutter/data/repository/app_config_repository.dart';
import 'package:cafejari_flutter/domain/entity/app_config/app_config.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';

abstract class AppConfigUseCase {
  Future<Versions> getAppVersions();
}

class AppConfigUseCaseImpl extends BaseUseCase implements AppConfigUseCase {
  final AppConfigRepository appConfigRepository;

  AppConfigUseCaseImpl(this.appConfigRepository);

  @override
  Future<Versions> getAppVersions() async {
    try {
      final List<VersionResponse> response = await appConfigRepository.fetchVersion();
      return response.map((e) {
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