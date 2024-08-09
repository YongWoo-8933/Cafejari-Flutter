import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/app_config/app_config.dart';
import 'package:cafejari_flutter/domain/repository.dart';


class AppConfigUseCase {
  final AppConfigRepository appConfigRepository;

  AppConfigUseCase(this.appConfigRepository);

  Future<bool> getIsInstalledFirstTime() async => await appConfigRepository.getIsInstalledFirstTime();

  setIsInstalledFirstTime(bool isInstalled) async => await appConfigRepository.putIsInstalledFirstTime(isInstalled);

  Future<bool> getIsReviewSubmitted() async => await appConfigRepository.getIsReviewSubmitted();

  setIsReviewSubmitted(bool isSubmitted) async => await appConfigRepository.putIsReviewSubmitted(isSubmitted);

  Future<bool> getIsFlagButtonTapped() async => await appConfigRepository.getIsFlagButtonTapped();

  setIsFlagButtonTapped(bool isTapped) async => await appConfigRepository.putIsFlagButtonTapped(isTapped);

  Future<DateTime> getLastPopUpTime() async => await appConfigRepository.getLastPopUpTime();

  setLastPopUpTime(DateTime datetime) async => await appConfigRepository.putLastPopUpTime(datetime);

  Future<Versions> getAppVersions() async {
    try {
      return await appConfigRepository.fetchVersion();
    } on ErrorWithMessage {
      rethrow;
    }
  }
}