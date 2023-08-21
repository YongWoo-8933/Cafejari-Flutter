// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Brand {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrandCopyWith<Brand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandCopyWith<$Res> {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) then) =
      _$BrandCopyWithImpl<$Res, Brand>;
  @useResult
  $Res call({int id, String name, String imageUrl});
}

/// @nodoc
class _$BrandCopyWithImpl<$Res, $Val extends Brand>
    implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BrandCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$$_BrandCopyWith(_$_Brand value, $Res Function(_$_Brand) then) =
      __$$_BrandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String imageUrl});
}

/// @nodoc
class __$$_BrandCopyWithImpl<$Res> extends _$BrandCopyWithImpl<$Res, _$_Brand>
    implements _$$_BrandCopyWith<$Res> {
  __$$_BrandCopyWithImpl(_$_Brand _value, $Res Function(_$_Brand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_$_Brand(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Brand implements _Brand {
  _$_Brand({required this.id, required this.name, required this.imageUrl});

  @override
  final int id;
  @override
  final String name;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Brand(id: $id, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Brand &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BrandCopyWith<_$_Brand> get copyWith =>
      __$$_BrandCopyWithImpl<_$_Brand>(this, _$identity);
}

abstract class _Brand implements Brand {
  factory _Brand(
      {required final int id,
      required final String name,
      required final String imageUrl}) = _$_Brand;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_BrandCopyWith<_$_Brand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Item {
  int get itemId => throw _privateConstructorUsedError;
  int get brandId => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get limitDay => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get smallImageUrl => throw _privateConstructorUsedError;
  String get largeImageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {int itemId,
      int brandId,
      int price,
      int limitDay,
      String name,
      String description,
      String smallImageUrl,
      String largeImageUrl});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? brandId = null,
    Object? price = null,
    Object? limitDay = null,
    Object? name = null,
    Object? description = null,
    Object? smallImageUrl = null,
    Object? largeImageUrl = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      limitDay: null == limitDay
          ? _value.limitDay
          : limitDay // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      smallImageUrl: null == smallImageUrl
          ? _value.smallImageUrl
          : smallImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      largeImageUrl: null == largeImageUrl
          ? _value.largeImageUrl
          : largeImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int itemId,
      int brandId,
      int price,
      int limitDay,
      String name,
      String description,
      String smallImageUrl,
      String largeImageUrl});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Item>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? brandId = null,
    Object? price = null,
    Object? limitDay = null,
    Object? name = null,
    Object? description = null,
    Object? smallImageUrl = null,
    Object? largeImageUrl = null,
  }) {
    return _then(_$_Item(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      limitDay: null == limitDay
          ? _value.limitDay
          : limitDay // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      smallImageUrl: null == smallImageUrl
          ? _value.smallImageUrl
          : smallImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      largeImageUrl: null == largeImageUrl
          ? _value.largeImageUrl
          : largeImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Item implements _Item {
  _$_Item(
      {required this.itemId,
      required this.brandId,
      required this.price,
      required this.limitDay,
      required this.name,
      required this.description,
      required this.smallImageUrl,
      required this.largeImageUrl});

  @override
  final int itemId;
  @override
  final int brandId;
  @override
  final int price;
  @override
  final int limitDay;
  @override
  final String name;
  @override
  final String description;
  @override
  final String smallImageUrl;
  @override
  final String largeImageUrl;

  @override
  String toString() {
    return 'Item(itemId: $itemId, brandId: $brandId, price: $price, limitDay: $limitDay, name: $name, description: $description, smallImageUrl: $smallImageUrl, largeImageUrl: $largeImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.limitDay, limitDay) ||
                other.limitDay == limitDay) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.smallImageUrl, smallImageUrl) ||
                other.smallImageUrl == smallImageUrl) &&
            (identical(other.largeImageUrl, largeImageUrl) ||
                other.largeImageUrl == largeImageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId, brandId, price, limitDay,
      name, description, smallImageUrl, largeImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);
}

abstract class _Item implements Item {
  factory _Item(
      {required final int itemId,
      required final int brandId,
      required final int price,
      required final int limitDay,
      required final String name,
      required final String description,
      required final String smallImageUrl,
      required final String largeImageUrl}) = _$_Item;

  @override
  int get itemId;
  @override
  int get brandId;
  @override
  int get price;
  @override
  int get limitDay;
  @override
  String get name;
  @override
  String get description;
  @override
  String get smallImageUrl;
  @override
  String get largeImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Brandcon {
  int get brandconId => throw _privateConstructorUsedError;
  int get itemId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get expirationDate => throw _privateConstructorUsedError;
  bool get isUsed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrandconCopyWith<Brandcon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandconCopyWith<$Res> {
  factory $BrandconCopyWith(Brandcon value, $Res Function(Brandcon) then) =
      _$BrandconCopyWithImpl<$Res, Brandcon>;
  @useResult
  $Res call(
      {int brandconId,
      int itemId,
      String imageUrl,
      String description,
      DateTime expirationDate,
      bool isUsed});
}

/// @nodoc
class _$BrandconCopyWithImpl<$Res, $Val extends Brandcon>
    implements $BrandconCopyWith<$Res> {
  _$BrandconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandconId = null,
    Object? itemId = null,
    Object? imageUrl = null,
    Object? description = null,
    Object? expirationDate = null,
    Object? isUsed = null,
  }) {
    return _then(_value.copyWith(
      brandconId: null == brandconId
          ? _value.brandconId
          : brandconId // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BrandconCopyWith<$Res> implements $BrandconCopyWith<$Res> {
  factory _$$_BrandconCopyWith(
          _$_Brandcon value, $Res Function(_$_Brandcon) then) =
      __$$_BrandconCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int brandconId,
      int itemId,
      String imageUrl,
      String description,
      DateTime expirationDate,
      bool isUsed});
}

/// @nodoc
class __$$_BrandconCopyWithImpl<$Res>
    extends _$BrandconCopyWithImpl<$Res, _$_Brandcon>
    implements _$$_BrandconCopyWith<$Res> {
  __$$_BrandconCopyWithImpl(
      _$_Brandcon _value, $Res Function(_$_Brandcon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandconId = null,
    Object? itemId = null,
    Object? imageUrl = null,
    Object? description = null,
    Object? expirationDate = null,
    Object? isUsed = null,
  }) {
    return _then(_$_Brandcon(
      brandconId: null == brandconId
          ? _value.brandconId
          : brandconId // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Brandcon implements _Brandcon {
  _$_Brandcon(
      {required this.brandconId,
      required this.itemId,
      required this.imageUrl,
      required this.description,
      required this.expirationDate,
      required this.isUsed});

  @override
  final int brandconId;
  @override
  final int itemId;
  @override
  final String imageUrl;
  @override
  final String description;
  @override
  final DateTime expirationDate;
  @override
  final bool isUsed;

  @override
  String toString() {
    return 'Brandcon(brandconId: $brandconId, itemId: $itemId, imageUrl: $imageUrl, description: $description, expirationDate: $expirationDate, isUsed: $isUsed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Brandcon &&
            (identical(other.brandconId, brandconId) ||
                other.brandconId == brandconId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brandconId, itemId, imageUrl,
      description, expirationDate, isUsed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BrandconCopyWith<_$_Brandcon> get copyWith =>
      __$$_BrandconCopyWithImpl<_$_Brandcon>(this, _$identity);
}

abstract class _Brandcon implements Brandcon {
  factory _Brandcon(
      {required final int brandconId,
      required final int itemId,
      required final String imageUrl,
      required final String description,
      required final DateTime expirationDate,
      required final bool isUsed}) = _$_Brandcon;

  @override
  int get brandconId;
  @override
  int get itemId;
  @override
  String get imageUrl;
  @override
  String get description;
  @override
  DateTime get expirationDate;
  @override
  bool get isUsed;
  @override
  @JsonKey(ignore: true)
  _$$_BrandconCopyWith<_$_Brandcon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Coupon {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CouponCopyWith<Coupon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponCopyWith<$Res> {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) then) =
      _$CouponCopyWithImpl<$Res, Coupon>;
  @useResult
  $Res call({int id, String name, String description, String imageUrl});
}

/// @nodoc
class _$CouponCopyWithImpl<$Res, $Val extends Coupon>
    implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CouponCopyWith<$Res> implements $CouponCopyWith<$Res> {
  factory _$$_CouponCopyWith(_$_Coupon value, $Res Function(_$_Coupon) then) =
      __$$_CouponCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String description, String imageUrl});
}

/// @nodoc
class __$$_CouponCopyWithImpl<$Res>
    extends _$CouponCopyWithImpl<$Res, _$_Coupon>
    implements _$$_CouponCopyWith<$Res> {
  __$$_CouponCopyWithImpl(_$_Coupon _value, $Res Function(_$_Coupon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
  }) {
    return _then(_$_Coupon(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Coupon implements _Coupon {
  _$_Coupon(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl});

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Coupon(id: $id, name: $name, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Coupon &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CouponCopyWith<_$_Coupon> get copyWith =>
      __$$_CouponCopyWithImpl<_$_Coupon>(this, _$identity);
}

abstract class _Coupon implements Coupon {
  factory _Coupon(
      {required final int id,
      required final String name,
      required final String description,
      required final String imageUrl}) = _$_Coupon;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_CouponCopyWith<_$_Coupon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserCoupon {
  int get userCouponId => throw _privateConstructorUsedError;
  int get couponId => throw _privateConstructorUsedError;
  bool get isUsed => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  DateTime get expirationPeriod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCouponCopyWith<UserCoupon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCouponCopyWith<$Res> {
  factory $UserCouponCopyWith(
          UserCoupon value, $Res Function(UserCoupon) then) =
      _$UserCouponCopyWithImpl<$Res, UserCoupon>;
  @useResult
  $Res call(
      {int userCouponId,
      int couponId,
      bool isUsed,
      String name,
      String description,
      String imageUrl,
      DateTime expirationPeriod});
}

/// @nodoc
class _$UserCouponCopyWithImpl<$Res, $Val extends UserCoupon>
    implements $UserCouponCopyWith<$Res> {
  _$UserCouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCouponId = null,
    Object? couponId = null,
    Object? isUsed = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? expirationPeriod = null,
  }) {
    return _then(_value.copyWith(
      userCouponId: null == userCouponId
          ? _value.userCouponId
          : userCouponId // ignore: cast_nullable_to_non_nullable
              as int,
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      expirationPeriod: null == expirationPeriod
          ? _value.expirationPeriod
          : expirationPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCouponCopyWith<$Res>
    implements $UserCouponCopyWith<$Res> {
  factory _$$_UserCouponCopyWith(
          _$_UserCoupon value, $Res Function(_$_UserCoupon) then) =
      __$$_UserCouponCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int userCouponId,
      int couponId,
      bool isUsed,
      String name,
      String description,
      String imageUrl,
      DateTime expirationPeriod});
}

/// @nodoc
class __$$_UserCouponCopyWithImpl<$Res>
    extends _$UserCouponCopyWithImpl<$Res, _$_UserCoupon>
    implements _$$_UserCouponCopyWith<$Res> {
  __$$_UserCouponCopyWithImpl(
      _$_UserCoupon _value, $Res Function(_$_UserCoupon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCouponId = null,
    Object? couponId = null,
    Object? isUsed = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? expirationPeriod = null,
  }) {
    return _then(_$_UserCoupon(
      userCouponId: null == userCouponId
          ? _value.userCouponId
          : userCouponId // ignore: cast_nullable_to_non_nullable
              as int,
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      expirationPeriod: null == expirationPeriod
          ? _value.expirationPeriod
          : expirationPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_UserCoupon implements _UserCoupon {
  _$_UserCoupon(
      {required this.userCouponId,
      required this.couponId,
      required this.isUsed,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.expirationPeriod});

  @override
  final int userCouponId;
  @override
  final int couponId;
  @override
  final bool isUsed;
  @override
  final String name;
  @override
  final String description;
  @override
  final String imageUrl;
  @override
  final DateTime expirationPeriod;

  @override
  String toString() {
    return 'UserCoupon(userCouponId: $userCouponId, couponId: $couponId, isUsed: $isUsed, name: $name, description: $description, imageUrl: $imageUrl, expirationPeriod: $expirationPeriod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCoupon &&
            (identical(other.userCouponId, userCouponId) ||
                other.userCouponId == userCouponId) &&
            (identical(other.couponId, couponId) ||
                other.couponId == couponId) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.expirationPeriod, expirationPeriod) ||
                other.expirationPeriod == expirationPeriod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCouponId, couponId, isUsed,
      name, description, imageUrl, expirationPeriod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCouponCopyWith<_$_UserCoupon> get copyWith =>
      __$$_UserCouponCopyWithImpl<_$_UserCoupon>(this, _$identity);
}

abstract class _UserCoupon implements UserCoupon {
  factory _UserCoupon(
      {required final int userCouponId,
      required final int couponId,
      required final bool isUsed,
      required final String name,
      required final String description,
      required final String imageUrl,
      required final DateTime expirationPeriod}) = _$_UserCoupon;

  @override
  int get userCouponId;
  @override
  int get couponId;
  @override
  bool get isUsed;
  @override
  String get name;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  DateTime get expirationPeriod;
  @override
  @JsonKey(ignore: true)
  _$$_UserCouponCopyWith<_$_UserCoupon> get copyWith =>
      throw _privateConstructorUsedError;
}