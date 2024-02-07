import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/app_config/app_config_response.dart';
import 'package:cafejari_flutter/data/repository/app_config_repository.dart';
import 'package:cafejari_flutter/domain/entity/app_config/app_config.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';

abstract class AppConfigUseCase {
  Future<bool> getIsInstalledFirstTime();
  setIsInstalledFirstTime(bool isInstalled);
  Future<bool> getIsReviewSubmitted();
  setIsReviewSubmitted(bool isSubmitted);
  Future<bool> getIsFlagButtonTapped();
  setIsFlagButtonTapped(bool isTapped);
  Future<DateTime> getLastPopUpTime();
  setLastPopUpTime(DateTime datetime);

  Future<Versions> getAppVersions();
}

class AppConfigUseCaseImpl extends BaseUseCase implements AppConfigUseCase {
  final AppConfigRepository appConfigRepository;

  AppConfigUseCaseImpl(this.appConfigRepository);

  @override
  Future<bool> getIsInstalledFirstTime() async => await appConfigRepository.getIsInstalledFirstTime();

  @override
  setIsInstalledFirstTime(bool isInstalled) async => await appConfigRepository.putIsInstalledFirstTime(isInstalled);

  @override
  Future<bool> getIsReviewSubmitted() async => await appConfigRepository.getIsReviewSubmitted();

  @override
  setIsReviewSubmitted(bool isSubmitted) async => await appConfigRepository.putIsReviewSubmitted(isSubmitted);

  @override
  Future<bool> getIsFlagButtonTapped() async => await appConfigRepository.getIsFlagButtonTapped();

  @override
  setIsFlagButtonTapped(bool isTapped) async => await appConfigRepository.putIsFlagButtonTapped(isTapped);

  @override
  Future<DateTime> getLastPopUpTime() async => await appConfigRepository.getLastPopUpTime();

  @override
  setLastPopUpTime(DateTime datetime) async => await appConfigRepository.putLastPopUpTime(datetime);

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