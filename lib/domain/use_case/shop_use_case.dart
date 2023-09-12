
import 'package:cafejari_flutter/data/remote/dto/shop/shop_response.dart';
import 'package:cafejari_flutter/data/repository/shop_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/shop_use_case/get_my_user_coupons.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';

/// 상점 관련 data를 처리하는 use case
abstract interface class ShopUseCase {
  Future<Brands> getBrands();
  Future<Coupons> getCoupons();
  Future<Items> getItems();
  Future<Brandcons> getMyBrandcons({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  });
  Future<UserCoupons> getMyUserCoupons({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  });
  Future<Brandcon> buyBrandcon({
    required String accessToken,
    required int itemId,
    required Function(String) onAccessTokenRefresh
  });
  Future<Brandcon> updateBrandconIsUsed({
    required String accessToken,
    required int brandconId,
    required bool isUsed,
    required Function(String) onAccessTokenRefresh
  });
  Future<void> deleteBrandcon({
    required String accessToken,
    required int brandconId,
    required Function(String) onAccessTokenRefresh
  });
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
      Items items = itemResponseList.map((itemResponse) {
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
      items.sort((a, b) => a.price.compareTo(b.price));
      return items;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Brandcons> getMyBrandcons({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      List<BrandconResponse> brandconResponseList = await shopRepository.fetchMyBrandcon(accessToken: accessToken);
      return brandconResponseList.map((brandconResponse) {
        return parseBrandconFromBrandconResponse(brandconResponse: brandconResponse);
      }).toList();
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        List<BrandconResponse> brandconResponseList = await shopRepository.fetchMyBrandcon(accessToken: newToken);
        return brandconResponseList.map((brandconResponse) {
          return parseBrandconFromBrandconResponse(brandconResponse: brandconResponse);
        }).toList();
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      print("여까지 오는지?");
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<UserCoupons> getMyUserCoupons({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    final f = GetMyUserCoupons();
    try {
      return await f(
          shopRepository: shopRepository,
          accessToken: accessToken
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
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
  Future<Brandcon> buyBrandcon({
    required String accessToken,
    required int itemId,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return parseBrandconFromBrandconResponse(
        brandconResponse: await shopRepository.postBrandcon(accessToken: accessToken, itemId: itemId)
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        return parseBrandconFromBrandconResponse(
          brandconResponse: await shopRepository.postBrandcon(accessToken: newToken, itemId: itemId)
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
  Future<Brandcon> updateBrandconIsUsed({
    required String accessToken,
    required int brandconId,
    required bool isUsed,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return parseBrandconFromBrandconResponse(
        brandconResponse: await shopRepository.updateBrandcon(
          accessToken: accessToken,
          brandconId: brandconId,
          isUsed: isUsed
        )
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        return parseBrandconFromBrandconResponse(
          brandconResponse: await shopRepository.updateBrandcon(
            accessToken: newToken,
            brandconId: brandconId,
              isUsed: isUsed
          )
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
  Future<void> deleteBrandcon({
    required String accessToken,
    required int brandconId,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      await shopRepository.deleteBrandcon(accessToken: accessToken, brandconId: brandconId);
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        await shopRepository.deleteBrandcon(accessToken: newToken, brandconId: brandconId);
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