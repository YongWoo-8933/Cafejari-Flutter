import 'package:cafejari_flutter/data/remote/dto/log/cafe_log_response.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leaderboard_response.g.dart';


@JsonSerializable()
class RankerResponse {
  final int id, sharing_count;
  final PartialUserResponse user;

  RankerResponse({
    required this.id,
    required this.sharing_count,
    required this.user});

  factory RankerResponse.fromJson(Map<String, dynamic> json) => _$RankerResponseFromJson(json);
}

@JsonSerializable()
class MonthlyHotCafeLogResponse {
  final int id;
  final String date;
  final CafeLogResponse cafe_log;

  MonthlyHotCafeLogResponse({
    required this.id,
    required this.date,
    required this.cafe_log});

  factory MonthlyHotCafeLogResponse.fromJson(Map<String, dynamic> json) => _$MonthlyHotCafeLogResponseFromJson(json);
}