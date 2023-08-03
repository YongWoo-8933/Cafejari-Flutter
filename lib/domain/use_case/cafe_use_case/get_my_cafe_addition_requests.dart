
import 'package:cafejari_flutter/data/remote/dto/request/request_response.dart';
import 'package:cafejari_flutter/data/repository/request_repository.dart';
import 'package:cafejari_flutter/domain/entity/request/request.dart';
import 'package:cafejari_flutter/core/exception.dart';

/// GetMyCafeAdditionRequests의 실제 구현부
class GetMyCafeAdditionRequests {
  Future<CafeAdditionRequests> call({
    required RequestRepository requestRepository, required String accessToken}) async {
    try {
      List<CafeAdditionRequestResponse> requestResponseList = await requestRepository.fetchMyCafeAdditionRequest(accessToken: accessToken);
      CafeAdditionRequests cafeAdditionRequests = [];
      for (CafeAdditionRequestResponse requestResponse in requestResponseList) {
        cafeAdditionRequests.add(CafeAdditionRequest(
            id: requestResponse.id,
            totalFloor: 1,
            firstFloor: 1,
            cafeName: requestResponse.cafe.name,
            dongAddress: "",
            roadAddress: requestResponse.cafe.address,
            etc: "",
            rejectionReason: requestResponse.rejection_reason,
            isApproved: requestResponse.is_approved,
            requestedAt: DateTime.parse(requestResponse.request_at),
            answeredAt: DateTime.parse(requestResponse.answered_at),
            wallSocketRates: [],
            openingHour: null));
      }
      return cafeAdditionRequests;
    } on ErrorWithMessage {
      rethrow;
    } on AccessTokenExpired {
      rethrow;
    }
  }
}
