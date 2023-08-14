
import 'package:cafejari_flutter/data/remote/dto/shop/shop_response.dart';
import 'package:cafejari_flutter/data/repository/shop_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/shop_use_case/get_my_brandcons.dart';
import 'package:cafejari_flutter/domain/use_case/shop_use_case/get_my_user_coupons.dart';

/// 상점 관련 data를 처리하는 use case
abstract interface class ShopUseCase {
  Future<Brands> getBrands();
  Future<Coupons> getCoupons();
  Future<Items> getItems();
  Future<Brandcons> getMyBrandcons({required String accessToken});
  Future<UserCoupons> getMyUserCoupons({required String accessToken});
}

/// ShopUseCase 구현 부분
class ShopUseCaseImpl extends BaseUseCase implements ShopUseCase {
  final TokenRepository tokenRepository;
  final ShopRepository shopRepository;

  ShopUseCaseImpl({required this.tokenRepository, required this.shopRepository});

  @override
  Future<Brands> getBrands() async {
    try {
      List<BrandResponse> brandResponseList = await shopRepository.fetchBrand();
      return brandResponseList.map((e) {
        return Brand(id: e.id, name: e.name, imageUrl: e.image ?? "");
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Coupons> getCoupons() async {
    try {
      List<CouponResponse> couponResponseList = await shopRepository.fetchCoupon();
      return couponResponseList.map((couponResponse) {
        return Coupon(
          id: couponResponse.id,
          name: couponResponse.name,
          description: couponResponse.description,
          imageUrl: couponResponse.image
        );
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Items> getItems() async {
    try {
      List<ItemResponse> itemResponseList = await shopRepository.fetchItem();
      return itemResponseList.map((itemResponse) {
        return Item(
          itemId: itemResponse.id,
          brandId: itemResponse.brand,
          price: itemResponse.price,
          limitDay: itemResponse.limit_day,
          name: itemResponse.name,
          description: itemResponse.description,
          smallImageUrl: itemResponse.small_image_url,
          largeImageUrl: itemResponse.large_image_url
        );
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Brandcons> getMyBrandcons({required String accessToken}) async {
    final f = GetMyBrandcons();
    try {
      return await f(
          shopRepository: shopRepository,
          accessToken: accessToken
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try {
        return await f(
            shopRepository: shopRepository,
            accessToken: newToken
        );
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<UserCoupons> getMyUserCoupons({required String accessToken}) async {
    final f = GetMyUserCoupons();
    try {
      return await f(
          shopRepository: shopRepository,
          accessToken: accessToken
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try {
        return await f(
            shopRepository: shopRepository,
            accessToken: newToken
        );
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}