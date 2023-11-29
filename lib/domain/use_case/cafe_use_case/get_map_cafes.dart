import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';

/// getMapCafes의 실제 구현부
class GetMapCafes {
  Future<Cafes> call({
    required CafeRepository cafeRepository, required NCameraPosition cameraPosition}) async {
    try {
      List<CafeResponse> cafeResponseList = await cafeRepository.fetchMapCafe(
          latitude: cameraPosition.target.latitude,
          longitude: cameraPosition.target.longitude,
          zoomLevel: cameraPosition.zoom._calculateZoomLevel()
      );
      return cafeResponseList.map((e) => parseCafeFromCafeResponse(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }
}

extension ZoomLevel on double {
  int _calculateZoomLevel() {
    if(this >= 14.0) {
      return 1;
    } else if(this >= 12.0) {
      return 2;
    } else {
      return 3;
    }
  }
}