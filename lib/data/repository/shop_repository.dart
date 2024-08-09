import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/shop/shop_response.dart';
import 'package:cafejari_flutter/data/repository/util.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/domain/repository.dart';

/// shop repository의 구현부
class ShopRepositoryImpl implements ShopRepository {
  final APIService service;

  ShopRepositoryImpl(this.service);

  @override
  Future<Brands> fetchBrand() async {
    try {
      final List<dynamic> response = await service.request(
        method: HttpMethod.get,
        appLabel: "shop",
        endpoint: "brand/");
      final res = response.map((dynamic e) => BrandResponse.fromJson(e)).toList();
      return res.map((e) {
        return Brand(id: e.id, name: e.name, imageUrl: e.image ?? "");
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Items> fetchItem() async {
    try {
      final List<dynamic> response = await service.request(
          method: HttpMethod.get,
          appLabel: "shop",
          endpoint: "item/");
      final res = response.map((dynamic e) => ItemResponse.fromJson(e)).toList();
      return res.map((itemResponse) {
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
  Future<Brandcons> fetchMyBrandcon({required String accessToken}) async {
    try {
      final List<dynamic> response = await service.request(
          method: HttpMethod.get,
          appLabel: "shop",
          endpoint: "gifticon/",
          accessToken: accessToken);
      final res = response.map((dynamic e) => BrandconResponse.fromJson(e)).toList();
      return res.map((brandconResponse) {
        return parseBrandconFromBrandconResponse(brandconResponse: brandconResponse);
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<Brandcon> postBrandcon({required String accessToken, required int itemId}) async {
    try {
      final dynamic response = await service.request(
        method: HttpMethod.post,
        appLabel: "shop",
        endpoint: "gifticon/",
        accessToken: accessToken,
        body: {"item_id": itemId}
      );
      final res = BrandconResponse.fromJson(response);
      return parseBrandconFromBrandconResponse(brandconResponse: res);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<Brandcon> updateBrandcon({
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
      final res = BrandconResponse.fromJson(response);
      return parseBrandconFromBrandconResponse(brandconResponse: res);
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