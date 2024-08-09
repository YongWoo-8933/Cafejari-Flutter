import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/repository.dart';


class ShopUseCase {
  final TokenRepository tokenRepository;
  final ShopRepository shopRepository;

  ShopUseCase({required this.tokenRepository, required this.shopRepository});

  Future<Brands> getBrands() async {
    try {
      return await shopRepository.fetchBrand();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Items> getItems() async {
    try {
      return await shopRepository.fetchItem();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Brandcons> getMyBrandcons({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await shopRepository.fetchMyBrandcon(accessToken: accessToken);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await shopRepository.fetchMyBrandcon(accessToken: newToken);
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Brandcon> buyBrandcon({
    required String accessToken,
    required int itemId,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await shopRepository.postBrandcon(accessToken: accessToken, itemId: itemId);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await shopRepository.postBrandcon(accessToken: newToken, itemId: itemId);
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Brandcon> updateBrandconIsUsed({
    required String accessToken,
    required int brandconId,
    required bool isUsed,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await shopRepository.updateBrandcon(
        accessToken: accessToken,
        brandconId: brandconId,
        isUsed: isUsed
      );
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await shopRepository.updateBrandcon(
          accessToken: newToken,
          brandconId: brandconId,
          isUsed: isUsed
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

  Future<void> deleteBrandcon({
    required String accessToken,
    required int brandconId,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      await shopRepository.deleteBrandcon(accessToken: accessToken, brandconId: brandconId);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
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