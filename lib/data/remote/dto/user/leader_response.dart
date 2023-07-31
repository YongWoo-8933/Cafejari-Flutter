import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leader_response.g.dart';


@JsonSerializable()
class MonthSharingRankerResponse {
  final int id, sharing_count;
  final PartialUser user;

  MonthSharingRankerResponse({
    required this.id,
    required this.sharing_count,
    required this.user});

  factory MonthSharingRankerResponse.fromJson(Map<String, dynamic> json) => _$MonthSharingRankerResponseFromJson(json);
}

@JsonSerializable()
class MonthlyHotCafeLogResponse {
  final int id;
  final int? cafe_log;
  final String date;

  MonthlyHotCafeLogResponse({
    required this.id,
    required this.cafe_log,
    required this.date});

  factory MonthlyHotCafeLogResponse.fromJson(Map<String, dynamic> json) => _$MonthlyHotCafeLogResponseFromJson(json);
}

@JsonSerializable()
class TotalSharingRankerResponse {
  final int id, sharing_count;
  final PartialUser user;

  TotalSharingRankerResponse({
    required this.id,
    required this.sharing_count,
    required this.user});

  factory TotalSharingRankerResponse.fromJson(Map<String, dynamic> json) => _$TotalSharingRankerResponseFromJson(json);
}

@JsonSerializable()
class WeekSharingRankerResponse {
  final int id, sharing_count;
  final PartialUser user;

  WeekSharingRankerResponse({
    required this.id,
    required this.sharing_count,
    required this.user});

  factory WeekSharingRankerResponse.fromJson(Map<String, dynamic> json) => _$WeekSharingRankerResponseFromJson(json);
}