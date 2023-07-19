import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leader_response.g.dart';


@JsonSerializable()
class LeaderResponse {
  final int id, ranking, activity;
  final UserResponse user;

  LeaderResponse({
    required this.id,
    required this.ranking,
    required this.activity,
    required this.user
  });

  factory LeaderResponse.fromJson(Map<String, dynamic> json) => _$LeaderResponseFromJson(json);
}