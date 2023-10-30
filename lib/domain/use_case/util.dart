
import 'dart:math';

import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/core/extension/string.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe_log/cafe_log_response.dart';
import 'package:cafejari_flutter/data/remote/dto/challenge/challenge_response.dart';
import 'package:cafejari_flutter/data/remote/dto/push/push_response.dart';
import 'package:cafejari_flutter/data/remote/dto/request/request_response.dart';
import 'package:cafejari_flutter/data/remote/dto/shop/shop_response.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/cafe_log/cafe_log.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/domain/entity/request/request.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

/// cafe response로부터 Cafe 객체를 뽑아내는 함수
Cafe parseCafeFromCafeResponse(CafeResponse cafeResponse) {
  CafeFloors cafeFloors = [];
  for (CafeFloorCafeRepResponse cafeFloorResponse in cafeResponse.cafe_floor) {
    OccupancyRateUpdates recentUpdates = [];
    for (OccupancyRateUpdateRepResponse updateResponse in cafeFloorResponse.recent_updated_log) {
      recentUpdates.add(
        parseOccupancyRateUpdateFromOccupancyRateUpdateRepResponse(updateResponse: updateResponse));
    }
    double? wallSocketRate;
    double? occupancyRatePrediction;
    if (cafeFloorResponse.wall_socket_rate.isNotNull) {
      wallSocketRate = double.parse(cafeFloorResponse.wall_socket_rate!);
    }
    if (cafeFloorResponse.occupancy_rate_prediction.isNotNull) {
      occupancyRatePrediction = double.parse(cafeFloorResponse.occupancy_rate_prediction!.occupancy_rate);
    }
    cafeFloors.add(CafeFloor(
        id: cafeFloorResponse.id,
        floor: cafeFloorResponse.floor,
        pointPrediction: cafeFloorResponse.point_prediction,
        restroom: cafeFloorResponse.restroom,
        hasSeat: cafeFloorResponse.has_seat,
        wallSocketRate: wallSocketRate,
        occupancyRatePrediction: occupancyRatePrediction,
        cafe: Cafe.empty(),
        recentUpdates: recentUpdates
    ));
  }
  int? recentUpdatedFloor;
  double? recentUpdatedOccupancyRate;
  // recent update 검토
  OccupancyRateUpdate? recentUpdate;
  for(CafeFloor cafeFloor in cafeFloors) {
    if(cafeFloor.recentUpdates.isNotEmpty) {
      final OccupancyRateUpdate update = cafeFloor.recentUpdates[0];
      if(recentUpdate.isNull) {
        recentUpdate = update;
        recentUpdatedFloor = cafeFloor.floor;
        recentUpdatedOccupancyRate = update.occupancyRate;
      } else {
        // 현재 floor의 업데이트 시간이 더 최근일 때만 갱신
        if(update.update.compareTo(recentUpdate!.update) > 0) {
          recentUpdate = update;
          recentUpdatedFloor = cafeFloor.floor;
          recentUpdatedOccupancyRate = update.occupancyRate;
        }
      }
    }
  }
  // 최근 업데이트가 없으면 prediction 검토
  if(recentUpdate.isNull) {
    double? minOccupancyPrediction;
    for(CafeFloor cafeFloor in cafeFloors) {
      if(cafeFloor.occupancyRatePrediction.isNotNull) {
        if(minOccupancyPrediction.isNull) {
          minOccupancyPrediction = cafeFloor.occupancyRatePrediction;
          recentUpdatedFloor = cafeFloor.floor;
          recentUpdatedOccupancyRate = cafeFloor.occupancyRatePrediction;
        } else {
          // 현재 floor의 예상 혼잡도가 더 낮을 때만 갱신
          if(cafeFloor.occupancyRatePrediction! < minOccupancyPrediction!) {
            minOccupancyPrediction = cafeFloor.occupancyRatePrediction;
            recentUpdatedFloor = cafeFloor.floor;
            recentUpdatedOccupancyRate = cafeFloor.occupancyRatePrediction;
          }
        }
      }
    }
  }
  // 이미지 정리
  List<String> imageUrls = cafeResponse.cafe_image.map((e) => e.image).toList();
  // vip 정리
  List<PartialUser> vips = cafeResponse.cafe_vip.map((e) {
    return parsePartialUserFromPartialUserResponse(partialUserResponse: e.user, updateCount: 0);
  }).toList();
  // 콘센트 최대 보급율, 최대 층 정리
  int? maximumWallSocketFloor;
  double? maximumWallSocketRate;
  for(CafeFloor cafeFloor in cafeFloors) {
    if(cafeFloor.wallSocketRate.isNotNull) {
      if(maximumWallSocketRate.isNull) {
        maximumWallSocketFloor = cafeFloor.floor;
        maximumWallSocketRate = cafeFloor.wallSocketRate;
      } else {
        // 현재 floor의 콘센트 보급율이 더 클 경우만 업데이트
        if(cafeFloor.wallSocketRate! > maximumWallSocketRate!) {
          maximumWallSocketFloor = cafeFloor.floor;
          maximumWallSocketRate = cafeFloor.wallSocketRate;
        }
      }
    }
  }
  // cati tag text 정리
  final cati = cafeResponse.cati;
  String returnTage = "";
  if (cati.isNull) {
    returnTage = "# 카페의 태그를 만들어주세요!";
  } else if (cati!.openness == 0 && cati.coffee == 0 && cati.workspace == 0 && cati.acidity == 0) {
    returnTage = "# 카페의 태그를 만들어주세요!";
  } else {
    List<String> returnTagList = [];
    if(cati.openness > 0) returnTagList.add("#개방적인  ");
    if(cati.openness < 0) returnTagList.add("#아늑한  ");
    if(cati.coffee > 0) returnTagList.add("#커피맛집  ");
    if(cati.coffee < 0) returnTagList.add("#음료맛집  ");
    if(cati.workspace > 0) returnTagList.add("#공부/업무  ");
    if(cati.workspace < 0) returnTagList.add("#감성카페  ");
    if(cati.acidity > 0) returnTagList.add("#산미  ");
    if(cati.acidity < 0) returnTagList.add("#산미없음  ");

    returnTagList.asMap().forEach((index, tag) {
      if(index == 2) returnTage += "\n";
      returnTage += tag;
    });
  }

  // 최종 산출
  return Cafe(
    id: cafeResponse.id,
    recentUpdatedFloor: recentUpdatedFloor,
    recentUpdatedOccupancyRate: recentUpdatedOccupancyRate,
    maximumWallSocketFloor: maximumWallSocketFloor,
    maximumWallSocketRate: maximumWallSocketRate,
    isOpened: cafeResponse.is_opened,
    isClosed: cafeResponse.is_closed,
    name: cafeResponse.name,
    address: cafeResponse.address,
    brandName: cafeResponse.brand?.name,
    brandImageUrl: cafeResponse.brand?.image,
    latLng: NLatLng(cafeResponse.latitude, cafeResponse.longitude),
    cafeFloors: cafeFloors,
    catiTagText: returnTage,
    cati: cafeResponse.cati.isNotNull ? CATI(
      openness: cafeResponse.cati!.openness.round(),
      coffee: cafeResponse.cati!.coffee.round(),
      workspace: cafeResponse.cati!.workspace.round(),
      acidity: cafeResponse.cati!.acidity.round()
    ) : null,
    openingHour: cafeResponse.opening_hour.isNotNull ? OpeningHour(
      mon: cafeResponse.opening_hour!.mon,
      tue: cafeResponse.opening_hour!.tue,
      wed: cafeResponse.opening_hour!.wed,
      thu: cafeResponse.opening_hour!.thu,
      fri: cafeResponse.opening_hour!.fri,
      sat: cafeResponse.opening_hour!.sat,
      sun: cafeResponse.opening_hour!.sun
    ) : null,
    imageUrls: imageUrls,
    vips: vips
  );
}

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
    myCATI: CATI(
      openness: userResponse.profile?.cati_openness ?? User.empty().myCATI.openness,
      coffee: userResponse.profile?.cati_coffee ?? User.empty().myCATI.coffee,
      workspace: userResponse.profile?.cati_workspace ?? User.empty().myCATI.workspace,
      acidity: userResponse.profile?.cati_acidity ?? User.empty().myCATI.acidity
    ),
    grade: Grade(
      id: userResponse.profile?.grade.id ?? User.empty().grade.id,
      step: userResponse.profile?.grade.step ?? User.empty().grade.step,
      updateCountRequirement: userResponse.profile?.grade.sharing_count_requirement ?? User.empty().grade.updateCountRequirement,
      updateRestrictionPerCafe: userResponse.profile?.grade.sharing_restriction_per_cafe ?? User.empty().grade.updateRestrictionPerCafe,
      stackRestrictionPerDay: userResponse.profile?.grade.activity_stack_restriction_per_day ?? User.empty().grade.stackRestrictionPerDay,
      name: userResponse.profile?.grade.name ?? User.empty().grade.name,
      imageUrl: userResponse.profile?.grade.image ?? User.empty().grade.imageUrl,
      description: userResponse.profile?.grade.description ?? User.empty().grade.description),
    favoriteCafes: userResponse.profile?.favorite_cafe.map((e) => parseCafeFromCafeResponse(e)).toList() ?? []
  );
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
      nickname: partialUserResponse.profile.nickname,
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
          pointPrediction: 0,
          restroom: updateResponse.cafe_floor.restroom,
          hasSeat: updateResponse.cafe_floor.has_seat,
          wallSocketRate: wallSocketRate,
          occupancyRatePrediction: null,
          cafe: parseCafeFromCafeRepResponse(cafeRepResponse: updateResponse.cafe_floor.cafe),
          recentUpdates: []),
      user: null
  );
}

/// CafeRepResponse로부터 Cafe 객체를 뽑아내는 함수
Cafe parseCafeFromCafeRepResponse({required CafeRepResponse cafeRepResponse}) {
  return Cafe(
      id: cafeRepResponse.id,
      recentUpdatedFloor: null,
      recentUpdatedOccupancyRate: null,
      maximumWallSocketRate: null,
      maximumWallSocketFloor: null,
      isOpened: cafeRepResponse.is_opened,
      isClosed: cafeRepResponse.is_closed,
      name: cafeRepResponse.name,
      address: cafeRepResponse.address,
      brandName: null,
      brandImageUrl: null,
      cati: null,
      catiTagText: "",
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

/// ChallengeResponse로부터 Challenge 객체를 뽑아내는 함수
Challenge parseChallengeFromChallengeResponse({
  required ChallengeResponse challengeResponse,
  required List<String> challengerProfileImages
}) {
  var totalPoint = 0;
  for(ChallengeMilestoneResponse milestoneResponse in challengeResponse.challenge_milestone) {
    totalPoint += milestoneResponse.point;
  }
  List<String> newImages = List.from(challengerProfileImages);
  newImages.shuffle(Random(DateTime.now().millisecond));
  if (newImages.length > 2) newImages = newImages.sublist(0, 3);
  return Challenge(
    id: challengeResponse.id,
    participantLimit: challengeResponse.participant_limit,
    goal: challengeResponse.goal,
    totalPoint: totalPoint,
    name: challengeResponse.name,
    description: challengeResponse.description,
    imageUrl: challengeResponse.image,
    startAt: DateTime.parse(challengeResponse.start),
    finishAt: DateTime.parse(challengeResponse.finish),
    available: challengeResponse.available,
    challengerUserIds: challengeResponse.challenger,
    challengerProfileImages: newImages,
    challengeMilestones: challengeResponse.challenge_milestone.map((e) {
      return ChallengeMilestone(
        id: e.id,
        point: e.point,
        count: e.count,
        progressRate: double.parse(e.progress_rate),
        description: e.description);
    }).toList()
  );
}

/// BrandconResponse로부터 Brandcon 객체를 뽑아내는 함수
Brandcon parseBrandconFromBrandconResponse({required BrandconResponse brandconResponse}) {
  return Brandcon(
    brandconId: brandconResponse.id,
    itemId: brandconResponse.item,
    imageUrl: brandconResponse.image,
    expirationDate: DateTime.parse(brandconResponse.expiration_period),
    isUsed: brandconResponse.is_used
  );
}

/// CafeAdditionRequestResponse로부터 CafeAdditionRequest 객체를 뽑아내는 함수
CafeAdditionRequest parseCafeAdditionRequestFromCafeAdditionRequestResponse({required CafeAdditionRequestResponse requestResponse}) {
  return CafeAdditionRequest(
    id: requestResponse.id,
    topFloor: 1,
    bottomFloor: 1,
    cafeName: requestResponse.cafe.name,
    dongAddress: "",
    roadAddress: requestResponse.cafe.address,
    etc: "",
    rejectionReason: requestResponse.rejection_reason,
    isApproved: requestResponse.is_approved,
    requestedAt: DateTime.parse(requestResponse.requested_at),
    answeredAt: DateTime.parse(requestResponse.answered_at),
    wallSocketRates: [],
    openingHour: null
  );
}

/// PushResponse로부터 Push 객체를 뽑아내는 함수
Push parsePushFromPushResponse({required PushResponse pushResponse}) {
  return Push(
    id: pushResponse.id,
    title: pushResponse.title,
    body: pushResponse.body,
    pushedAt: DateTime.parse(pushResponse.pushed_at),
    isRead: pushResponse.is_read,
    type: pushResponse.type.toPushType()
  );
}