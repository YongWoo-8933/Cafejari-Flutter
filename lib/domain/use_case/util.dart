
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/core/extension/string.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe_log/cafe_log_response.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/cafe_log/cafe_log.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

/// user response로부터 User 객체를 뽑아내는 함수
User parseUserFromUserResponse(UserResponse userResponse) {
  return User(
      userId: userResponse.id,
      profileId: userResponse.profile?.id ?? User.empty().profileId,
      point: userResponse.profile?.point ?? User.empty().point,
      isAdmin: userResponse.is_superuser,
      isActive: userResponse.is_active,
      isMarketingPushEnabled: userResponse.profile?.marketing_push_enabled ?? User.empty().isMarketingPushEnabled,
      isOccupancyPushEnabled: userResponse.profile?.occupancy_push_enabled ?? User.empty().isOccupancyPushEnabled,
      isLogPushEnabled: userResponse.profile?.log_push_enabled ?? User.empty().isLogPushEnabled,
      dateJoined: DateTime.parse(userResponse.date_joined),
      lastLogin: DateTime.parse(userResponse.last_login),
      nickname: userResponse.profile?.nickname ?? User.empty().nickname,
      fcmToken: userResponse.profile?.fcm_token ?? User.empty().fcmToken,
      imageUrl: userResponse.profile?.profile_image.image ?? User.empty().imageUrl,
      email: userResponse.email,
      phoneNumber: userResponse.profile?.phone_number,
      ageRange: userResponse.profile?.age_range,
      dateOfBirth: userResponse.profile?.date_of_birth,
      gender: userResponse.profile?.gender,
      grade: Grade(
          id: userResponse.profile?.grade.id ?? User.empty().grade.id,
          step: userResponse.profile?.grade.step ?? User.empty().grade.step,
          updateCountRequirement: userResponse.profile?.grade.sharing_count_requirement ?? User.empty().grade.updateCountRequirement,
          updateRestrictionPerCafe: userResponse.profile?.grade.sharing_restriction_per_cafe ?? User.empty().grade.updateRestrictionPerCafe,
          stackRestrictionPerDay: userResponse.profile?.grade.activity_stack_restriction_per_day ?? User.empty().grade.stackRestrictionPerDay,
          name: userResponse.profile?.grade.name ?? User.empty().grade.name,
          imageUrl: userResponse.profile?.grade.image ?? User.empty().grade.imageUrl,
          description: userResponse.profile?.grade.description ?? User.empty().grade.description),
      favoriteCafes: userResponse.profile?.favorite_cafe ?? User.empty().favoriteCafes);
}

/// partial user response로부터 partial user 객체를 뽑아내는 함수
PartialUser parsePartialUserFromPartialUserResponse({
  required PartialUserResponse partialUserResponse, required int updateCount}) {
  return PartialUser(
      userId: partialUserResponse.id,
      profileId: partialUserResponse.profile.id,
      updateCount: updateCount,
      dateJoined: DateTime.parse(partialUserResponse.date_joined),
      imageUrl: partialUserResponse.profile.profile_image.image,
      grade: Grade(
          id: partialUserResponse.profile.grade.id,
          step: partialUserResponse.profile.grade.step,
          updateCountRequirement: partialUserResponse.profile.grade.sharing_count_requirement,
          updateRestrictionPerCafe: partialUserResponse.profile.grade.sharing_restriction_per_cafe,
          stackRestrictionPerDay: partialUserResponse.profile.grade.activity_stack_restriction_per_day,
          name: partialUserResponse.profile.grade.name,
          imageUrl: partialUserResponse.profile.grade.image ?? User.empty().grade.imageUrl,
          description: partialUserResponse.profile.grade.description ?? User.empty().grade.description));
}

/// OccupancyRateUpdateRepResponse로부터 occupancyRateUpdate 객체를 뽑아내는 함수
OccupancyRateUpdate parseOccupancyRateUpdateFromOccupancyRateUpdateRepResponse({
  required OccupancyRateUpdateRepResponse updateResponse}) {
  PartialUser? partialUser;
  if(updateResponse.user.isNotNull) {
    partialUser = parsePartialUserFromPartialUserResponse(
        partialUserResponse: updateResponse.user!, updateCount: 0);
  }
  return OccupancyRateUpdate(
      id: updateResponse.id,
      point: updateResponse.point,
      occupancyRate: double.parse(updateResponse.occupancy_rate),
      update: DateTime.parse(updateResponse.update),
      cafeFloor: CafeFloor.empty(),
      user: partialUser);
}

/// OccupancyRateUpdateResponse로부터 occupancyRateUpdate 객체를 뽑아내는 함수
OccupancyRateUpdate parseOccupancyRateUpdateFromOccupancyRateUpdateResponse({
  required OccupancyRateUpdateResponse updateResponse}) {
  double? wallSocketRate;
  if (updateResponse.cafe_floor.wall_socket_rate.isNotNull) {
    wallSocketRate = double.parse(updateResponse.cafe_floor.wall_socket_rate!);
  }
  return OccupancyRateUpdate(
      id: updateResponse.id,
      point: updateResponse.point,
      occupancyRate: double.parse(updateResponse.occupancy_rate),
      update: DateTime.parse(updateResponse.update),
      cafeFloor: CafeFloor(
          id: updateResponse.cafe_floor.id,
          floor: updateResponse.cafe_floor.floor,
          restroom: updateResponse.cafe_floor.restroom,
          hasSeat: updateResponse.cafe_floor.has_seat,
          wallSocketRate: wallSocketRate,
          occupancyRatePrediction: null,
          cafe: parseCafeFromCafeRepResponse(cafeRepResponse: updateResponse.cafe_floor.cafe),
          recentUpdates: []),
      user: null);
}

/// CafeRepResponse로부터 Cafe 객체를 뽑아내는 함수
Cafe parseCafeFromCafeRepResponse({required CafeRepResponse cafeRepResponse}) {
  return Cafe(
      id: cafeRepResponse.id,
      recentUpdatedFloor: null,
      recentUpdatedOccupancyRate: null,
      isClosed: cafeRepResponse.is_closed,
      name: cafeRepResponse.name,
      address: cafeRepResponse.address,
      latLng: NLatLng(cafeRepResponse.latitude, cafeRepResponse.longitude),
      cafeFloors: [],
      openingHour: null,
      imageUrls: [],
      vips: []);
}

/// CafeLogResponse로부터 CafeLog 객체를 뽑아내는 함수
CafeLog parseCafeLogFromCafeLogResponse({required CafeLogResponse cafeLogResponse}) {
  List<int> likeUserIds = [];
  List<int> reportUserIds = [];
  List<String> imageUrls = [];
  for(CafeLogLikeResponse logLikeResponse in cafeLogResponse.like) {
    likeUserIds.add(logLikeResponse.user);
  }
  for(CafeLogReportResponse logReportResponse in cafeLogResponse.report) {
    reportUserIds.add(logReportResponse.user);
  }
  for(SnapshotResponse snapshotResponse in cafeLogResponse.snapshot) {
    imageUrls.add(snapshotResponse.image);
  }
  return CafeLog(
      id: cafeLogResponse.id,
      isVisible: cafeLogResponse.is_visible,
      isPrivate: cafeLogResponse.is_private,
      content: cafeLogResponse.content,
      createdAt: DateTime.parse(cafeLogResponse.created_at),
      updatedAt: DateTime.parse(cafeLogResponse.updated_at),
      theme: cafeLogResponse.theme.toCafeLogTheme(),
      user: parsePartialUserFromPartialUserResponse(
          partialUserResponse: cafeLogResponse.user, updateCount: 0),
      cafe: parseCafeFromCafeRepResponse(cafeRepResponse: cafeLogResponse.cafe),
      likeUserIds: likeUserIds,
      reportUserIds: reportUserIds,
      imageUrls: imageUrls);
}