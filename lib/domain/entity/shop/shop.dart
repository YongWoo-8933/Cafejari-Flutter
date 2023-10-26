import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop.freezed.dart';

typedef Brands = List<Brand>;

/// brand 모델
@freezed
class Brand with _$Brand {
  factory Brand({
    required final int id,
    required final String name,
    required final String imageUrl
  }) = _Brand;

  factory Brand.empty() => Brand(
      id: 0,
      name: "",
      imageUrl: "");
}

typedef Items = List<Item>;

/// item 모델
@freezed
class Item with _$Item {
  factory Item({
    required final int itemId,
    required final int brandId,
    required final int price,
    required final int limitDay,
    required final String name,
    required final String description,
    required final String smallImageUrl,
    required final String largeImageUrl
  }) = _Item;

  factory Item.empty() => Item(
      itemId: 0,
      brandId: 0,
      price: 0,
      limitDay: 0,
      name: "",
      description: "",
      smallImageUrl: "",
      largeImageUrl: "");
}

typedef Brandcons = List<Brandcon>;

/// Brandcon 모델
@freezed
class Brandcon with _$Brandcon {
  factory Brandcon({
    required final int brandconId,
    required final int itemId,
    required final String imageUrl,
    required final DateTime expirationDate,
    required final bool isUsed
  }) = _Brandcon;

  factory Brandcon.empty() => Brandcon(
      brandconId: 0,
      itemId: 0,
      imageUrl: "",
      expirationDate: DateTime(2022),
      isUsed: true);
}

typedef Coupons = List<Coupon>;

/// coupon 모델
@freezed
class Coupon with _$Coupon {
  factory Coupon({
    required final int id,
    required final String name,
    required final String description,
    required final String imageUrl
  }) = _Coupon;

  factory Coupon.empty() => Coupon(
      id: 0,
      name: "",
      description: "",
      imageUrl: "");
}

typedef UserCoupons = List<UserCoupon>;

/// user coupon 모델
@freezed
class UserCoupon with _$UserCoupon {
  factory UserCoupon({
    required final int userCouponId,
    required final int couponId,
    required final bool isUsed,
    required final String name,
    required final String description,
    required final String imageUrl,
    required final DateTime expirationPeriod
  }) = _UserCoupon;

  factory UserCoupon.empty() => UserCoupon(
      userCouponId: 0,
      couponId: 0,
      isUsed: false,
      name: "",
      description: "",
      imageUrl: "",
      expirationPeriod: DateTime(2022));
}
