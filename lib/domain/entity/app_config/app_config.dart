
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';


typedef Versions = List<Version>;

/// version 모델
@freezed
class Version with _$Version {
  factory Version({
    required final int major,
    required final int minor,
    required final int patch,
    required final DateTime updatedAt,
    required final String description
  }) = _Version;

  factory Version.empty() => Version(
      major: 0,
      minor: 0,
      patch: 0,
      updatedAt: DateTime(2022),
      description: "");
}