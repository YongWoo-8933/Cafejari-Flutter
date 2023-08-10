
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/shop/shop_response.dart';
import 'package:cafejari_flutter/data/repository/shop_repository.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';

/// getMyBrandcons의 실제 구현부
class GetMyBrandcons {
  Future<Brandcons> call({required ShopRepository shopRepository, required String accessToken}) async {
    try {
      List<BrandconResponse> brandconResponseList = await shopRepository.fetchMyBrandcon(accessToken: accessToken);
      return brandconResponseList.map((brandconResponse) {
        return Brandcon(
          brandconId: brandconResponse.id,
          itemId: brandconResponse.item,
          imageUrl: brandconResponse.image,
          description: brandconResponse.description,
          expirationDate: DateTime.parse(brandconResponse.expiration_period),
          isUsed: brandconResponse.is_used
        );
      }).toList();
    } on AccessTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}
