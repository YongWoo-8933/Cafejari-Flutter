
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/shop/shop_response.dart';
import 'package:cafejari_flutter/data/repository/shop_repository.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';

/// getMyUserCoupons의 실제 구현부
class GetMyUserCoupons {
  Future<UserCoupons> call({required ShopRepository shopRepository, required String accessToken}) async {
    try {
      List<UserCouponResponse> userCouponResponseList = await shopRepository.fetchMyCoupon(accessToken: accessToken);
      return userCouponResponseList.map((userCouponResponse) {
        return UserCoupon(
          userCouponId: userCouponResponse.id,
          couponId: userCouponResponse.coupon.id,
          isUsed: userCouponResponse.is_used,
          name: userCouponResponse.coupon.name,
          description: userCouponResponse.coupon.description,
          imageUrl: userCouponResponse.coupon.image,
          expirationPeriod: DateTime.parse(userCouponResponse.expiration_period)
        );
      }).toList();
    } on AccessTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}
