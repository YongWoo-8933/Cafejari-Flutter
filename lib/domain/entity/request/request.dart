import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'request.freezed.dart';


typedef CafeAdditionRequests = List<CafeAdditionRequest>;

/// cafe addition request 모델
@freezed
class CafeAdditionRequest with _$CafeAdditionRequest {
  factory CafeAdditionRequest({
    required final int id,
    required final int topFloor,
    required final int bottomFloor,
    required final String cafeName,
    required final String dongAddress,
    required final String roadAddress,
    required final String etc,
    required final String? rejectionReason,
    required final bool isApproved,
    required final DateTime requestedAt,
    required final DateTime answeredAt,
    required final List<double> wallSocketRates,
    required final OpeningHour? openingHour
  }) = _CafeAdditionRequest;

  factory CafeAdditionRequest.empty() => CafeAdditionRequest(
      id: 0,
      topFloor: 1,
      bottomFloor: 1,
      cafeName: "",
      dongAddress: "",
      roadAddress: "",
      etc: "",
      rejectionReason: null,
      isApproved: false,
      requestedAt: DateTime(2022),
      answeredAt: DateTime(2022),
      wallSocketRates: [],
      openingHour: null);
}


typedef CafeModificationRequests = List<CafeAdditionRequest>;

/// cafe modification request 모델
@freezed
class CafeModificationRequest with _$CafeModificationRequest {
  factory CafeModificationRequest({
    required final int id,
    required final Cafe cafe,
    required final bool isApproved,
    required final DateTime requestedAt,
    required final DateTime answeredAt,
    required final String? rejectionReason,
  }) = _CafeModificationRequest;

  factory CafeModificationRequest.empty() => CafeModificationRequest(
      id: 0,
      cafe: Cafe.empty(),
      isApproved: false,
      requestedAt: DateTime(2022),
      answeredAt: DateTime(2022),
      rejectionReason: null);
}