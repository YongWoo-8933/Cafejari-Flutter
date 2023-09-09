
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/shop/shop_response.dart';

/// shop 관련 저장소
abstract interface class ShopRepository {
  // GET
  Future<List<BrandResponse>> fetchBrand();
  Future<List<CouponResponse>> fetchCoupon();
  Future<List<ItemResponse>> fetchItem();
  Future<List<BrandconResponse>> fetchMyBrandcon({required String accessToken});
  Future<List<UserCouponResponse>> fetchMyCoupon({required String accessToken});

  // POST
  Future<BrandconResponse> postBrandcon({required String accessToken, required int itemId});

  // PUT
  Future updateBrandcon({
    required String accessToken,
    required int brandconId,
    bool? isUsed
  });

  // DELETE
  Future<void> deleteBrandcon({required String accessToken, required int brandconId});
}

/// shop repository의 구현부
class ShopRepositoryImpl implements ShopRepository {
  final APIService service;

  ShopRepositoryImpl(this.service);

  @override
  Future<List<BrandResponse>> fetchBrand() async {
    try {
      final List<dynamic> response = await service.request(
          method: HttpMethod.get,
          appLabel: "shop",
          endpoint: "brand/");
      return response.map((dynamic e) => BrandResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<CouponResponse>> fetchCoupon() async {
    try {
      final List<dynamic> response = await service.request(
          method: HttpMethod.get,
          appLabel: "shop",
          endpoint: "coupon/");
      return response.map((dynamic e) => CouponResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<ItemResponse>> fetchItem() async {
    try {
      final List<dynamic> response = await service.request(
          method: HttpMethod.get,
          appLabel: "shop",
          endpoint: "item/");
      return response.map((dynamic e) => ItemResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<BrandconResponse>> fetchMyBrandcon({required String accessToken}) async {
    try {
      final List<dynamic> response = await service.request(
          method: HttpMethod.get,
          appLabel: "shop",
          endpoint: "gifticon/",
          accessToken: accessToken);
      return response.map((dynamic e) => BrandconResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<List<UserCouponResponse>> fetchMyCoupon({required String accessToken}) async {
    try {
      final List<dynamic> response = await service.request(
          method: HttpMethod.get,
          appLabel: "shop",
          endpoint: "user_coupon/",
          accessToken: accessToken);
      return response.map((dynamic e) => UserCouponResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<BrandconResponse> postBrandcon({required String accessToken, required int itemId}) async {
    try {
      final dynamic response = await service.request(
        method: HttpMethod.post,
        appLabel: "shop",
        endpoint: "gifticon/",
        accessToken: accessToken,
        body: {"item_id": itemId}
      );
      return BrandconResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<BrandconResponse> updateBrandcon({
    required String accessToken,
    required int brandconId,
    bool? isUsed
  }) async {
    Map<String, dynamic> requestBody = {};
    if (isUsed.isNotNull) requestBody["is_used"] = isUsed!;
    try {
      final dynamic response = await service.request(
        method: HttpMethod.put,
        appLabel: "shop",
        endpoint: "gifticon/$brandconId/",
        accessToken: accessToken,
        body: requestBody
      );
      return BrandconResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<void> deleteBrandcon({required String accessToken, required int brandconId}) async {
    try {
      await service.request(
        method: HttpMethod.delete,
        appLabel: "shop",
        endpoint: "gifticon/$brandconId/",
        accessToken: accessToken
      );
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}