
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/shop/shop_response.dart';

/// shop 관련 저장소
abstract interface class ShopRepository {
  Future<List<BrandResponse>> fetchBrand();
  Future<List<CouponResponse>> fetchCoupon();
  Future<List<ItemResponse>> fetchItem();
  Future<List<BrandconResponse>> fetchMyBrandcon({required String accessToken});
  Future<List<UserCouponResponse>> fetchMyCoupon({required String accessToken});
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
}