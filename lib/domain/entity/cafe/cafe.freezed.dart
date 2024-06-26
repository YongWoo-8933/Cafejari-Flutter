// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cafe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Cafe {
  int get id => throw _privateConstructorUsedError;
  int? get recentUpdatedFloor => throw _privateConstructorUsedError;
  double? get recentUpdatedOccupancyRate => throw _privateConstructorUsedError;
  double? get maximumWallSocketRate => throw _privateConstructorUsedError;
  int? get maximumWallSocketFloor => throw _privateConstructorUsedError;
  bool get isOpened => throw _privateConstructorUsedError;
  bool get isClosed => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;
  String? get brandImageUrl => throw _privateConstructorUsedError;
  CATI? get cati => throw _privateConstructorUsedError;
  String get catiTagText => throw _privateConstructorUsedError;
  NLatLng get latLng => throw _privateConstructorUsedError;
  List<CafeFloor> get cafeFloors => throw _privateConstructorUsedError;
  OpeningHour? get openingHour => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  List<PartialUser> get vips => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CafeCopyWith<Cafe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeCopyWith<$Res> {
  factory $CafeCopyWith(Cafe value, $Res Function(Cafe) then) =
      _$CafeCopyWithImpl<$Res, Cafe>;
  @useResult
  $Res call(
      {int id,
      int? recentUpdatedFloor,
      double? recentUpdatedOccupancyRate,
      double? maximumWallSocketRate,
      int? maximumWallSocketFloor,
      bool isOpened,
      bool isClosed,
      String name,
      String address,
      String? brandName,
      String? brandImageUrl,
      CATI? cati,
      String catiTagText,
      NLatLng latLng,
      List<CafeFloor> cafeFloors,
      OpeningHour? openingHour,
      List<String> imageUrls,
      List<PartialUser> vips});

  $CATICopyWith<$Res>? get cati;
  $OpeningHourCopyWith<$Res>? get openingHour;
}

/// @nodoc
class _$CafeCopyWithImpl<$Res, $Val extends Cafe>
    implements $CafeCopyWith<$Res> {
  _$CafeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recentUpdatedFloor = freezed,
    Object? recentUpdatedOccupancyRate = freezed,
    Object? maximumWallSocketRate = freezed,
    Object? maximumWallSocketFloor = freezed,
    Object? isOpened = null,
    Object? isClosed = null,
    Object? name = null,
    Object? address = null,
    Object? brandName = freezed,
    Object? brandImageUrl = freezed,
    Object? cati = freezed,
    Object? catiTagText = null,
    Object? latLng = null,
    Object? cafeFloors = null,
    Object? openingHour = freezed,
    Object? imageUrls = null,
    Object? vips = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recentUpdatedFloor: freezed == recentUpdatedFloor
          ? _value.recentUpdatedFloor
          : recentUpdatedFloor // ignore: cast_nullable_to_non_nullable
              as int?,
      recentUpdatedOccupancyRate: freezed == recentUpdatedOccupancyRate
          ? _value.recentUpdatedOccupancyRate
          : recentUpdatedOccupancyRate // ignore: cast_nullable_to_non_nullable
              as double?,
      maximumWallSocketRate: freezed == maximumWallSocketRate
          ? _value.maximumWallSocketRate
          : maximumWallSocketRate // ignore: cast_nullable_to_non_nullable
              as double?,
      maximumWallSocketFloor: freezed == maximumWallSocketFloor
          ? _value.maximumWallSocketFloor
          : maximumWallSocketFloor // ignore: cast_nullable_to_non_nullable
              as int?,
      isOpened: null == isOpened
          ? _value.isOpened
          : isOpened // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      brandImageUrl: freezed == brandImageUrl
          ? _value.brandImageUrl
          : brandImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      cati: freezed == cati
          ? _value.cati
          : cati // ignore: cast_nullable_to_non_nullable
              as CATI?,
      catiTagText: null == catiTagText
          ? _value.catiTagText
          : catiTagText // ignore: cast_nullable_to_non_nullable
              as String,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as NLatLng,
      cafeFloors: null == cafeFloors
          ? _value.cafeFloors
          : cafeFloors // ignore: cast_nullable_to_non_nullable
              as List<CafeFloor>,
      openingHour: freezed == openingHour
          ? _value.openingHour
          : openingHour // ignore: cast_nullable_to_non_nullable
              as OpeningHour?,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vips: null == vips
          ? _value.vips
          : vips // ignore: cast_nullable_to_non_nullable
              as List<PartialUser>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CATICopyWith<$Res>? get cati {
    if (_value.cati == null) {
      return null;
    }

    return $CATICopyWith<$Res>(_value.cati!, (value) {
      return _then(_value.copyWith(cati: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OpeningHourCopyWith<$Res>? get openingHour {
    if (_value.openingHour == null) {
      return null;
    }

    return $OpeningHourCopyWith<$Res>(_value.openingHour!, (value) {
      return _then(_value.copyWith(openingHour: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CafeImplCopyWith<$Res> implements $CafeCopyWith<$Res> {
  factory _$$CafeImplCopyWith(
          _$CafeImpl value, $Res Function(_$CafeImpl) then) =
      __$$CafeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? recentUpdatedFloor,
      double? recentUpdatedOccupancyRate,
      double? maximumWallSocketRate,
      int? maximumWallSocketFloor,
      bool isOpened,
      bool isClosed,
      String name,
      String address,
      String? brandName,
      String? brandImageUrl,
      CATI? cati,
      String catiTagText,
      NLatLng latLng,
      List<CafeFloor> cafeFloors,
      OpeningHour? openingHour,
      List<String> imageUrls,
      List<PartialUser> vips});

  @override
  $CATICopyWith<$Res>? get cati;
  @override
  $OpeningHourCopyWith<$Res>? get openingHour;
}

/// @nodoc
class __$$CafeImplCopyWithImpl<$Res>
    extends _$CafeCopyWithImpl<$Res, _$CafeImpl>
    implements _$$CafeImplCopyWith<$Res> {
  __$$CafeImplCopyWithImpl(_$CafeImpl _value, $Res Function(_$CafeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recentUpdatedFloor = freezed,
    Object? recentUpdatedOccupancyRate = freezed,
    Object? maximumWallSocketRate = freezed,
    Object? maximumWallSocketFloor = freezed,
    Object? isOpened = null,
    Object? isClosed = null,
    Object? name = null,
    Object? address = null,
    Object? brandName = freezed,
    Object? brandImageUrl = freezed,
    Object? cati = freezed,
    Object? catiTagText = null,
    Object? latLng = null,
    Object? cafeFloors = null,
    Object? openingHour = freezed,
    Object? imageUrls = null,
    Object? vips = null,
  }) {
    return _then(_$CafeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recentUpdatedFloor: freezed == recentUpdatedFloor
          ? _value.recentUpdatedFloor
          : recentUpdatedFloor // ignore: cast_nullable_to_non_nullable
              as int?,
      recentUpdatedOccupancyRate: freezed == recentUpdatedOccupancyRate
          ? _value.recentUpdatedOccupancyRate
          : recentUpdatedOccupancyRate // ignore: cast_nullable_to_non_nullable
              as double?,
      maximumWallSocketRate: freezed == maximumWallSocketRate
          ? _value.maximumWallSocketRate
          : maximumWallSocketRate // ignore: cast_nullable_to_non_nullable
              as double?,
      maximumWallSocketFloor: freezed == maximumWallSocketFloor
          ? _value.maximumWallSocketFloor
          : maximumWallSocketFloor // ignore: cast_nullable_to_non_nullable
              as int?,
      isOpened: null == isOpened
          ? _value.isOpened
          : isOpened // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      brandImageUrl: freezed == brandImageUrl
          ? _value.brandImageUrl
          : brandImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      cati: freezed == cati
          ? _value.cati
          : cati // ignore: cast_nullable_to_non_nullable
              as CATI?,
      catiTagText: null == catiTagText
          ? _value.catiTagText
          : catiTagText // ignore: cast_nullable_to_non_nullable
              as String,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as NLatLng,
      cafeFloors: null == cafeFloors
          ? _value._cafeFloors
          : cafeFloors // ignore: cast_nullable_to_non_nullable
              as List<CafeFloor>,
      openingHour: freezed == openingHour
          ? _value.openingHour
          : openingHour // ignore: cast_nullable_to_non_nullable
              as OpeningHour?,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vips: null == vips
          ? _value._vips
          : vips // ignore: cast_nullable_to_non_nullable
              as List<PartialUser>,
    ));
  }
}

/// @nodoc

class _$CafeImpl implements _Cafe {
  _$CafeImpl(
      {required this.id,
      required this.recentUpdatedFloor,
      required this.recentUpdatedOccupancyRate,
      required this.maximumWallSocketRate,
      required this.maximumWallSocketFloor,
      required this.isOpened,
      required this.isClosed,
      required this.name,
      required this.address,
      required this.brandName,
      required this.brandImageUrl,
      required this.cati,
      required this.catiTagText,
      required this.latLng,
      required final List<CafeFloor> cafeFloors,
      required this.openingHour,
      required final List<String> imageUrls,
      required final List<PartialUser> vips})
      : _cafeFloors = cafeFloors,
        _imageUrls = imageUrls,
        _vips = vips;

  @override
  final int id;
  @override
  final int? recentUpdatedFloor;
  @override
  final double? recentUpdatedOccupancyRate;
  @override
  final double? maximumWallSocketRate;
  @override
  final int? maximumWallSocketFloor;
  @override
  final bool isOpened;
  @override
  final bool isClosed;
  @override
  final String name;
  @override
  final String address;
  @override
  final String? brandName;
  @override
  final String? brandImageUrl;
  @override
  final CATI? cati;
  @override
  final String catiTagText;
  @override
  final NLatLng latLng;
  final List<CafeFloor> _cafeFloors;
  @override
  List<CafeFloor> get cafeFloors {
    if (_cafeFloors is EqualUnmodifiableListView) return _cafeFloors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cafeFloors);
  }

  @override
  final OpeningHour? openingHour;
  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final List<PartialUser> _vips;
  @override
  List<PartialUser> get vips {
    if (_vips is EqualUnmodifiableListView) return _vips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vips);
  }

  @override
  String toString() {
    return 'Cafe(id: $id, recentUpdatedFloor: $recentUpdatedFloor, recentUpdatedOccupancyRate: $recentUpdatedOccupancyRate, maximumWallSocketRate: $maximumWallSocketRate, maximumWallSocketFloor: $maximumWallSocketFloor, isOpened: $isOpened, isClosed: $isClosed, name: $name, address: $address, brandName: $brandName, brandImageUrl: $brandImageUrl, cati: $cati, catiTagText: $catiTagText, latLng: $latLng, cafeFloors: $cafeFloors, openingHour: $openingHour, imageUrls: $imageUrls, vips: $vips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recentUpdatedFloor, recentUpdatedFloor) ||
                other.recentUpdatedFloor == recentUpdatedFloor) &&
            (identical(other.recentUpdatedOccupancyRate,
                    recentUpdatedOccupancyRate) ||
                other.recentUpdatedOccupancyRate ==
                    recentUpdatedOccupancyRate) &&
            (identical(other.maximumWallSocketRate, maximumWallSocketRate) ||
                other.maximumWallSocketRate == maximumWallSocketRate) &&
            (identical(other.maximumWallSocketFloor, maximumWallSocketFloor) ||
                other.maximumWallSocketFloor == maximumWallSocketFloor) &&
            (identical(other.isOpened, isOpened) ||
                other.isOpened == isOpened) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.brandImageUrl, brandImageUrl) ||
                other.brandImageUrl == brandImageUrl) &&
            (identical(other.cati, cati) || other.cati == cati) &&
            (identical(other.catiTagText, catiTagText) ||
                other.catiTagText == catiTagText) &&
            (identical(other.latLng, latLng) || other.latLng == latLng) &&
            const DeepCollectionEquality()
                .equals(other._cafeFloors, _cafeFloors) &&
            (identical(other.openingHour, openingHour) ||
                other.openingHour == openingHour) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality().equals(other._vips, _vips));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      recentUpdatedFloor,
      recentUpdatedOccupancyRate,
      maximumWallSocketRate,
      maximumWallSocketFloor,
      isOpened,
      isClosed,
      name,
      address,
      brandName,
      brandImageUrl,
      cati,
      catiTagText,
      latLng,
      const DeepCollectionEquality().hash(_cafeFloors),
      openingHour,
      const DeepCollectionEquality().hash(_imageUrls),
      const DeepCollectionEquality().hash(_vips));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeImplCopyWith<_$CafeImpl> get copyWith =>
      __$$CafeImplCopyWithImpl<_$CafeImpl>(this, _$identity);
}

abstract class _Cafe implements Cafe {
  factory _Cafe(
      {required final int id,
      required final int? recentUpdatedFloor,
      required final double? recentUpdatedOccupancyRate,
      required final double? maximumWallSocketRate,
      required final int? maximumWallSocketFloor,
      required final bool isOpened,
      required final bool isClosed,
      required final String name,
      required final String address,
      required final String? brandName,
      required final String? brandImageUrl,
      required final CATI? cati,
      required final String catiTagText,
      required final NLatLng latLng,
      required final List<CafeFloor> cafeFloors,
      required final OpeningHour? openingHour,
      required final List<String> imageUrls,
      required final List<PartialUser> vips}) = _$CafeImpl;

  @override
  int get id;
  @override
  int? get recentUpdatedFloor;
  @override
  double? get recentUpdatedOccupancyRate;
  @override
  double? get maximumWallSocketRate;
  @override
  int? get maximumWallSocketFloor;
  @override
  bool get isOpened;
  @override
  bool get isClosed;
  @override
  String get name;
  @override
  String get address;
  @override
  String? get brandName;
  @override
  String? get brandImageUrl;
  @override
  CATI? get cati;
  @override
  String get catiTagText;
  @override
  NLatLng get latLng;
  @override
  List<CafeFloor> get cafeFloors;
  @override
  OpeningHour? get openingHour;
  @override
  List<String> get imageUrls;
  @override
  List<PartialUser> get vips;
  @override
  @JsonKey(ignore: true)
  _$$CafeImplCopyWith<_$CafeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CafeFloor {
  int get id => throw _privateConstructorUsedError;
  int get floor => throw _privateConstructorUsedError;
  int get pointPrediction => throw _privateConstructorUsedError;
  String? get restroom => throw _privateConstructorUsedError;
  bool get hasSeat => throw _privateConstructorUsedError;
  double? get wallSocketRate => throw _privateConstructorUsedError;
  double? get occupancyRatePrediction => throw _privateConstructorUsedError;
  Cafe get cafe => throw _privateConstructorUsedError;
  List<OccupancyRateUpdate> get recentUpdates =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CafeFloorCopyWith<CafeFloor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeFloorCopyWith<$Res> {
  factory $CafeFloorCopyWith(CafeFloor value, $Res Function(CafeFloor) then) =
      _$CafeFloorCopyWithImpl<$Res, CafeFloor>;
  @useResult
  $Res call(
      {int id,
      int floor,
      int pointPrediction,
      String? restroom,
      bool hasSeat,
      double? wallSocketRate,
      double? occupancyRatePrediction,
      Cafe cafe,
      List<OccupancyRateUpdate> recentUpdates});

  $CafeCopyWith<$Res> get cafe;
}

/// @nodoc
class _$CafeFloorCopyWithImpl<$Res, $Val extends CafeFloor>
    implements $CafeFloorCopyWith<$Res> {
  _$CafeFloorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? floor = null,
    Object? pointPrediction = null,
    Object? restroom = freezed,
    Object? hasSeat = null,
    Object? wallSocketRate = freezed,
    Object? occupancyRatePrediction = freezed,
    Object? cafe = null,
    Object? recentUpdates = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      pointPrediction: null == pointPrediction
          ? _value.pointPrediction
          : pointPrediction // ignore: cast_nullable_to_non_nullable
              as int,
      restroom: freezed == restroom
          ? _value.restroom
          : restroom // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSeat: null == hasSeat
          ? _value.hasSeat
          : hasSeat // ignore: cast_nullable_to_non_nullable
              as bool,
      wallSocketRate: freezed == wallSocketRate
          ? _value.wallSocketRate
          : wallSocketRate // ignore: cast_nullable_to_non_nullable
              as double?,
      occupancyRatePrediction: freezed == occupancyRatePrediction
          ? _value.occupancyRatePrediction
          : occupancyRatePrediction // ignore: cast_nullable_to_non_nullable
              as double?,
      cafe: null == cafe
          ? _value.cafe
          : cafe // ignore: cast_nullable_to_non_nullable
              as Cafe,
      recentUpdates: null == recentUpdates
          ? _value.recentUpdates
          : recentUpdates // ignore: cast_nullable_to_non_nullable
              as List<OccupancyRateUpdate>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CafeCopyWith<$Res> get cafe {
    return $CafeCopyWith<$Res>(_value.cafe, (value) {
      return _then(_value.copyWith(cafe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CafeFloorImplCopyWith<$Res>
    implements $CafeFloorCopyWith<$Res> {
  factory _$$CafeFloorImplCopyWith(
          _$CafeFloorImpl value, $Res Function(_$CafeFloorImpl) then) =
      __$$CafeFloorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int floor,
      int pointPrediction,
      String? restroom,
      bool hasSeat,
      double? wallSocketRate,
      double? occupancyRatePrediction,
      Cafe cafe,
      List<OccupancyRateUpdate> recentUpdates});

  @override
  $CafeCopyWith<$Res> get cafe;
}

/// @nodoc
class __$$CafeFloorImplCopyWithImpl<$Res>
    extends _$CafeFloorCopyWithImpl<$Res, _$CafeFloorImpl>
    implements _$$CafeFloorImplCopyWith<$Res> {
  __$$CafeFloorImplCopyWithImpl(
      _$CafeFloorImpl _value, $Res Function(_$CafeFloorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? floor = null,
    Object? pointPrediction = null,
    Object? restroom = freezed,
    Object? hasSeat = null,
    Object? wallSocketRate = freezed,
    Object? occupancyRatePrediction = freezed,
    Object? cafe = null,
    Object? recentUpdates = null,
  }) {
    return _then(_$CafeFloorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      pointPrediction: null == pointPrediction
          ? _value.pointPrediction
          : pointPrediction // ignore: cast_nullable_to_non_nullable
              as int,
      restroom: freezed == restroom
          ? _value.restroom
          : restroom // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSeat: null == hasSeat
          ? _value.hasSeat
          : hasSeat // ignore: cast_nullable_to_non_nullable
              as bool,
      wallSocketRate: freezed == wallSocketRate
          ? _value.wallSocketRate
          : wallSocketRate // ignore: cast_nullable_to_non_nullable
              as double?,
      occupancyRatePrediction: freezed == occupancyRatePrediction
          ? _value.occupancyRatePrediction
          : occupancyRatePrediction // ignore: cast_nullable_to_non_nullable
              as double?,
      cafe: null == cafe
          ? _value.cafe
          : cafe // ignore: cast_nullable_to_non_nullable
              as Cafe,
      recentUpdates: null == recentUpdates
          ? _value._recentUpdates
          : recentUpdates // ignore: cast_nullable_to_non_nullable
              as List<OccupancyRateUpdate>,
    ));
  }
}

/// @nodoc

class _$CafeFloorImpl implements _CafeFloor {
  _$CafeFloorImpl(
      {required this.id,
      required this.floor,
      required this.pointPrediction,
      required this.restroom,
      required this.hasSeat,
      required this.wallSocketRate,
      required this.occupancyRatePrediction,
      required this.cafe,
      required final List<OccupancyRateUpdate> recentUpdates})
      : _recentUpdates = recentUpdates;

  @override
  final int id;
  @override
  final int floor;
  @override
  final int pointPrediction;
  @override
  final String? restroom;
  @override
  final bool hasSeat;
  @override
  final double? wallSocketRate;
  @override
  final double? occupancyRatePrediction;
  @override
  final Cafe cafe;
  final List<OccupancyRateUpdate> _recentUpdates;
  @override
  List<OccupancyRateUpdate> get recentUpdates {
    if (_recentUpdates is EqualUnmodifiableListView) return _recentUpdates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentUpdates);
  }

  @override
  String toString() {
    return 'CafeFloor(id: $id, floor: $floor, pointPrediction: $pointPrediction, restroom: $restroom, hasSeat: $hasSeat, wallSocketRate: $wallSocketRate, occupancyRatePrediction: $occupancyRatePrediction, cafe: $cafe, recentUpdates: $recentUpdates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeFloorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.pointPrediction, pointPrediction) ||
                other.pointPrediction == pointPrediction) &&
            (identical(other.restroom, restroom) ||
                other.restroom == restroom) &&
            (identical(other.hasSeat, hasSeat) || other.hasSeat == hasSeat) &&
            (identical(other.wallSocketRate, wallSocketRate) ||
                other.wallSocketRate == wallSocketRate) &&
            (identical(
                    other.occupancyRatePrediction, occupancyRatePrediction) ||
                other.occupancyRatePrediction == occupancyRatePrediction) &&
            (identical(other.cafe, cafe) || other.cafe == cafe) &&
            const DeepCollectionEquality()
                .equals(other._recentUpdates, _recentUpdates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      floor,
      pointPrediction,
      restroom,
      hasSeat,
      wallSocketRate,
      occupancyRatePrediction,
      cafe,
      const DeepCollectionEquality().hash(_recentUpdates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeFloorImplCopyWith<_$CafeFloorImpl> get copyWith =>
      __$$CafeFloorImplCopyWithImpl<_$CafeFloorImpl>(this, _$identity);
}

abstract class _CafeFloor implements CafeFloor {
  factory _CafeFloor(
          {required final int id,
          required final int floor,
          required final int pointPrediction,
          required final String? restroom,
          required final bool hasSeat,
          required final double? wallSocketRate,
          required final double? occupancyRatePrediction,
          required final Cafe cafe,
          required final List<OccupancyRateUpdate> recentUpdates}) =
      _$CafeFloorImpl;

  @override
  int get id;
  @override
  int get floor;
  @override
  int get pointPrediction;
  @override
  String? get restroom;
  @override
  bool get hasSeat;
  @override
  double? get wallSocketRate;
  @override
  double? get occupancyRatePrediction;
  @override
  Cafe get cafe;
  @override
  List<OccupancyRateUpdate> get recentUpdates;
  @override
  @JsonKey(ignore: true)
  _$$CafeFloorImplCopyWith<_$CafeFloorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OccupancyRateUpdate {
  int get id => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  double get occupancyRate => throw _privateConstructorUsedError;
  DateTime get update => throw _privateConstructorUsedError;
  CafeFloor get cafeFloor => throw _privateConstructorUsedError;
  PartialUser? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OccupancyRateUpdateCopyWith<OccupancyRateUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OccupancyRateUpdateCopyWith<$Res> {
  factory $OccupancyRateUpdateCopyWith(
          OccupancyRateUpdate value, $Res Function(OccupancyRateUpdate) then) =
      _$OccupancyRateUpdateCopyWithImpl<$Res, OccupancyRateUpdate>;
  @useResult
  $Res call(
      {int id,
      int point,
      double occupancyRate,
      DateTime update,
      CafeFloor cafeFloor,
      PartialUser? user});

  $CafeFloorCopyWith<$Res> get cafeFloor;
  $PartialUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$OccupancyRateUpdateCopyWithImpl<$Res, $Val extends OccupancyRateUpdate>
    implements $OccupancyRateUpdateCopyWith<$Res> {
  _$OccupancyRateUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? point = null,
    Object? occupancyRate = null,
    Object? update = null,
    Object? cafeFloor = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      occupancyRate: null == occupancyRate
          ? _value.occupancyRate
          : occupancyRate // ignore: cast_nullable_to_non_nullable
              as double,
      update: null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cafeFloor: null == cafeFloor
          ? _value.cafeFloor
          : cafeFloor // ignore: cast_nullable_to_non_nullable
              as CafeFloor,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PartialUser?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CafeFloorCopyWith<$Res> get cafeFloor {
    return $CafeFloorCopyWith<$Res>(_value.cafeFloor, (value) {
      return _then(_value.copyWith(cafeFloor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PartialUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $PartialUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OccupancyRateUpdateImplCopyWith<$Res>
    implements $OccupancyRateUpdateCopyWith<$Res> {
  factory _$$OccupancyRateUpdateImplCopyWith(_$OccupancyRateUpdateImpl value,
          $Res Function(_$OccupancyRateUpdateImpl) then) =
      __$$OccupancyRateUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int point,
      double occupancyRate,
      DateTime update,
      CafeFloor cafeFloor,
      PartialUser? user});

  @override
  $CafeFloorCopyWith<$Res> get cafeFloor;
  @override
  $PartialUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$OccupancyRateUpdateImplCopyWithImpl<$Res>
    extends _$OccupancyRateUpdateCopyWithImpl<$Res, _$OccupancyRateUpdateImpl>
    implements _$$OccupancyRateUpdateImplCopyWith<$Res> {
  __$$OccupancyRateUpdateImplCopyWithImpl(_$OccupancyRateUpdateImpl _value,
      $Res Function(_$OccupancyRateUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? point = null,
    Object? occupancyRate = null,
    Object? update = null,
    Object? cafeFloor = null,
    Object? user = freezed,
  }) {
    return _then(_$OccupancyRateUpdateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      occupancyRate: null == occupancyRate
          ? _value.occupancyRate
          : occupancyRate // ignore: cast_nullable_to_non_nullable
              as double,
      update: null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cafeFloor: null == cafeFloor
          ? _value.cafeFloor
          : cafeFloor // ignore: cast_nullable_to_non_nullable
              as CafeFloor,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PartialUser?,
    ));
  }
}

/// @nodoc

class _$OccupancyRateUpdateImpl implements _OccupancyRateUpdate {
  _$OccupancyRateUpdateImpl(
      {required this.id,
      required this.point,
      required this.occupancyRate,
      required this.update,
      required this.cafeFloor,
      required this.user});

  @override
  final int id;
  @override
  final int point;
  @override
  final double occupancyRate;
  @override
  final DateTime update;
  @override
  final CafeFloor cafeFloor;
  @override
  final PartialUser? user;

  @override
  String toString() {
    return 'OccupancyRateUpdate(id: $id, point: $point, occupancyRate: $occupancyRate, update: $update, cafeFloor: $cafeFloor, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OccupancyRateUpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.occupancyRate, occupancyRate) ||
                other.occupancyRate == occupancyRate) &&
            (identical(other.update, update) || other.update == update) &&
            (identical(other.cafeFloor, cafeFloor) ||
                other.cafeFloor == cafeFloor) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, point, occupancyRate, update, cafeFloor, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OccupancyRateUpdateImplCopyWith<_$OccupancyRateUpdateImpl> get copyWith =>
      __$$OccupancyRateUpdateImplCopyWithImpl<_$OccupancyRateUpdateImpl>(
          this, _$identity);
}

abstract class _OccupancyRateUpdate implements OccupancyRateUpdate {
  factory _OccupancyRateUpdate(
      {required final int id,
      required final int point,
      required final double occupancyRate,
      required final DateTime update,
      required final CafeFloor cafeFloor,
      required final PartialUser? user}) = _$OccupancyRateUpdateImpl;

  @override
  int get id;
  @override
  int get point;
  @override
  double get occupancyRate;
  @override
  DateTime get update;
  @override
  CafeFloor get cafeFloor;
  @override
  PartialUser? get user;
  @override
  @JsonKey(ignore: true)
  _$$OccupancyRateUpdateImplCopyWith<_$OccupancyRateUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OpeningHour {
  String get mon => throw _privateConstructorUsedError;
  String get tue => throw _privateConstructorUsedError;
  String get wed => throw _privateConstructorUsedError;
  String get thu => throw _privateConstructorUsedError;
  String get fri => throw _privateConstructorUsedError;
  String get sat => throw _privateConstructorUsedError;
  String get sun => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OpeningHourCopyWith<OpeningHour> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpeningHourCopyWith<$Res> {
  factory $OpeningHourCopyWith(
          OpeningHour value, $Res Function(OpeningHour) then) =
      _$OpeningHourCopyWithImpl<$Res, OpeningHour>;
  @useResult
  $Res call(
      {String mon,
      String tue,
      String wed,
      String thu,
      String fri,
      String sat,
      String sun});
}

/// @nodoc
class _$OpeningHourCopyWithImpl<$Res, $Val extends OpeningHour>
    implements $OpeningHourCopyWith<$Res> {
  _$OpeningHourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mon = null,
    Object? tue = null,
    Object? wed = null,
    Object? thu = null,
    Object? fri = null,
    Object? sat = null,
    Object? sun = null,
  }) {
    return _then(_value.copyWith(
      mon: null == mon
          ? _value.mon
          : mon // ignore: cast_nullable_to_non_nullable
              as String,
      tue: null == tue
          ? _value.tue
          : tue // ignore: cast_nullable_to_non_nullable
              as String,
      wed: null == wed
          ? _value.wed
          : wed // ignore: cast_nullable_to_non_nullable
              as String,
      thu: null == thu
          ? _value.thu
          : thu // ignore: cast_nullable_to_non_nullable
              as String,
      fri: null == fri
          ? _value.fri
          : fri // ignore: cast_nullable_to_non_nullable
              as String,
      sat: null == sat
          ? _value.sat
          : sat // ignore: cast_nullable_to_non_nullable
              as String,
      sun: null == sun
          ? _value.sun
          : sun // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpeningHourImplCopyWith<$Res>
    implements $OpeningHourCopyWith<$Res> {
  factory _$$OpeningHourImplCopyWith(
          _$OpeningHourImpl value, $Res Function(_$OpeningHourImpl) then) =
      __$$OpeningHourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mon,
      String tue,
      String wed,
      String thu,
      String fri,
      String sat,
      String sun});
}

/// @nodoc
class __$$OpeningHourImplCopyWithImpl<$Res>
    extends _$OpeningHourCopyWithImpl<$Res, _$OpeningHourImpl>
    implements _$$OpeningHourImplCopyWith<$Res> {
  __$$OpeningHourImplCopyWithImpl(
      _$OpeningHourImpl _value, $Res Function(_$OpeningHourImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mon = null,
    Object? tue = null,
    Object? wed = null,
    Object? thu = null,
    Object? fri = null,
    Object? sat = null,
    Object? sun = null,
  }) {
    return _then(_$OpeningHourImpl(
      mon: null == mon
          ? _value.mon
          : mon // ignore: cast_nullable_to_non_nullable
              as String,
      tue: null == tue
          ? _value.tue
          : tue // ignore: cast_nullable_to_non_nullable
              as String,
      wed: null == wed
          ? _value.wed
          : wed // ignore: cast_nullable_to_non_nullable
              as String,
      thu: null == thu
          ? _value.thu
          : thu // ignore: cast_nullable_to_non_nullable
              as String,
      fri: null == fri
          ? _value.fri
          : fri // ignore: cast_nullable_to_non_nullable
              as String,
      sat: null == sat
          ? _value.sat
          : sat // ignore: cast_nullable_to_non_nullable
              as String,
      sun: null == sun
          ? _value.sun
          : sun // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OpeningHourImpl implements _OpeningHour {
  _$OpeningHourImpl(
      {required this.mon,
      required this.tue,
      required this.wed,
      required this.thu,
      required this.fri,
      required this.sat,
      required this.sun});

  @override
  final String mon;
  @override
  final String tue;
  @override
  final String wed;
  @override
  final String thu;
  @override
  final String fri;
  @override
  final String sat;
  @override
  final String sun;

  @override
  String toString() {
    return 'OpeningHour(mon: $mon, tue: $tue, wed: $wed, thu: $thu, fri: $fri, sat: $sat, sun: $sun)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpeningHourImpl &&
            (identical(other.mon, mon) || other.mon == mon) &&
            (identical(other.tue, tue) || other.tue == tue) &&
            (identical(other.wed, wed) || other.wed == wed) &&
            (identical(other.thu, thu) || other.thu == thu) &&
            (identical(other.fri, fri) || other.fri == fri) &&
            (identical(other.sat, sat) || other.sat == sat) &&
            (identical(other.sun, sun) || other.sun == sun));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, mon, tue, wed, thu, fri, sat, sun);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpeningHourImplCopyWith<_$OpeningHourImpl> get copyWith =>
      __$$OpeningHourImplCopyWithImpl<_$OpeningHourImpl>(this, _$identity);
}

abstract class _OpeningHour implements OpeningHour {
  factory _OpeningHour(
      {required final String mon,
      required final String tue,
      required final String wed,
      required final String thu,
      required final String fri,
      required final String sat,
      required final String sun}) = _$OpeningHourImpl;

  @override
  String get mon;
  @override
  String get tue;
  @override
  String get wed;
  @override
  String get thu;
  @override
  String get fri;
  @override
  String get sat;
  @override
  String get sun;
  @override
  @JsonKey(ignore: true)
  _$$OpeningHourImplCopyWith<_$OpeningHourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CATI {
  int get openness => throw _privateConstructorUsedError;
  int get coffee => throw _privateConstructorUsedError;
  int get workspace => throw _privateConstructorUsedError;
  int get acidity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CATICopyWith<CATI> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CATICopyWith<$Res> {
  factory $CATICopyWith(CATI value, $Res Function(CATI) then) =
      _$CATICopyWithImpl<$Res, CATI>;
  @useResult
  $Res call({int openness, int coffee, int workspace, int acidity});
}

/// @nodoc
class _$CATICopyWithImpl<$Res, $Val extends CATI>
    implements $CATICopyWith<$Res> {
  _$CATICopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openness = null,
    Object? coffee = null,
    Object? workspace = null,
    Object? acidity = null,
  }) {
    return _then(_value.copyWith(
      openness: null == openness
          ? _value.openness
          : openness // ignore: cast_nullable_to_non_nullable
              as int,
      coffee: null == coffee
          ? _value.coffee
          : coffee // ignore: cast_nullable_to_non_nullable
              as int,
      workspace: null == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as int,
      acidity: null == acidity
          ? _value.acidity
          : acidity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CATIImplCopyWith<$Res> implements $CATICopyWith<$Res> {
  factory _$$CATIImplCopyWith(
          _$CATIImpl value, $Res Function(_$CATIImpl) then) =
      __$$CATIImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int openness, int coffee, int workspace, int acidity});
}

/// @nodoc
class __$$CATIImplCopyWithImpl<$Res>
    extends _$CATICopyWithImpl<$Res, _$CATIImpl>
    implements _$$CATIImplCopyWith<$Res> {
  __$$CATIImplCopyWithImpl(_$CATIImpl _value, $Res Function(_$CATIImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openness = null,
    Object? coffee = null,
    Object? workspace = null,
    Object? acidity = null,
  }) {
    return _then(_$CATIImpl(
      openness: null == openness
          ? _value.openness
          : openness // ignore: cast_nullable_to_non_nullable
              as int,
      coffee: null == coffee
          ? _value.coffee
          : coffee // ignore: cast_nullable_to_non_nullable
              as int,
      workspace: null == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as int,
      acidity: null == acidity
          ? _value.acidity
          : acidity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CATIImpl implements _CATI {
  _$CATIImpl(
      {required this.openness,
      required this.coffee,
      required this.workspace,
      required this.acidity});

  @override
  final int openness;
  @override
  final int coffee;
  @override
  final int workspace;
  @override
  final int acidity;

  @override
  String toString() {
    return 'CATI(openness: $openness, coffee: $coffee, workspace: $workspace, acidity: $acidity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CATIImpl &&
            (identical(other.openness, openness) ||
                other.openness == openness) &&
            (identical(other.coffee, coffee) || other.coffee == coffee) &&
            (identical(other.workspace, workspace) ||
                other.workspace == workspace) &&
            (identical(other.acidity, acidity) || other.acidity == acidity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, openness, coffee, workspace, acidity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CATIImplCopyWith<_$CATIImpl> get copyWith =>
      __$$CATIImplCopyWithImpl<_$CATIImpl>(this, _$identity);
}

abstract class _CATI implements CATI {
  factory _CATI(
      {required final int openness,
      required final int coffee,
      required final int workspace,
      required final int acidity}) = _$CATIImpl;

  @override
  int get openness;
  @override
  int get coffee;
  @override
  int get workspace;
  @override
  int get acidity;
  @override
  @JsonKey(ignore: true)
  _$$CATIImplCopyWith<_$CATIImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NaverSearchCafe {
  String get name => throw _privateConstructorUsedError;
  String get roadAddress => throw _privateConstructorUsedError;
  String get dongAddress => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NaverSearchCafeCopyWith<NaverSearchCafe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NaverSearchCafeCopyWith<$Res> {
  factory $NaverSearchCafeCopyWith(
          NaverSearchCafe value, $Res Function(NaverSearchCafe) then) =
      _$NaverSearchCafeCopyWithImpl<$Res, NaverSearchCafe>;
  @useResult
  $Res call(
      {String name,
      String roadAddress,
      String dongAddress,
      double latitude,
      double longitude});
}

/// @nodoc
class _$NaverSearchCafeCopyWithImpl<$Res, $Val extends NaverSearchCafe>
    implements $NaverSearchCafeCopyWith<$Res> {
  _$NaverSearchCafeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? roadAddress = null,
    Object? dongAddress = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roadAddress: null == roadAddress
          ? _value.roadAddress
          : roadAddress // ignore: cast_nullable_to_non_nullable
              as String,
      dongAddress: null == dongAddress
          ? _value.dongAddress
          : dongAddress // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NaverSearchCafeImplCopyWith<$Res>
    implements $NaverSearchCafeCopyWith<$Res> {
  factory _$$NaverSearchCafeImplCopyWith(_$NaverSearchCafeImpl value,
          $Res Function(_$NaverSearchCafeImpl) then) =
      __$$NaverSearchCafeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String roadAddress,
      String dongAddress,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$NaverSearchCafeImplCopyWithImpl<$Res>
    extends _$NaverSearchCafeCopyWithImpl<$Res, _$NaverSearchCafeImpl>
    implements _$$NaverSearchCafeImplCopyWith<$Res> {
  __$$NaverSearchCafeImplCopyWithImpl(
      _$NaverSearchCafeImpl _value, $Res Function(_$NaverSearchCafeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? roadAddress = null,
    Object? dongAddress = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$NaverSearchCafeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roadAddress: null == roadAddress
          ? _value.roadAddress
          : roadAddress // ignore: cast_nullable_to_non_nullable
              as String,
      dongAddress: null == dongAddress
          ? _value.dongAddress
          : dongAddress // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$NaverSearchCafeImpl implements _NaverSearchCafe {
  _$NaverSearchCafeImpl(
      {required this.name,
      required this.roadAddress,
      required this.dongAddress,
      required this.latitude,
      required this.longitude});

  @override
  final String name;
  @override
  final String roadAddress;
  @override
  final String dongAddress;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'NaverSearchCafe(name: $name, roadAddress: $roadAddress, dongAddress: $dongAddress, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NaverSearchCafeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.roadAddress, roadAddress) ||
                other.roadAddress == roadAddress) &&
            (identical(other.dongAddress, dongAddress) ||
                other.dongAddress == dongAddress) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, roadAddress, dongAddress, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NaverSearchCafeImplCopyWith<_$NaverSearchCafeImpl> get copyWith =>
      __$$NaverSearchCafeImplCopyWithImpl<_$NaverSearchCafeImpl>(
          this, _$identity);
}

abstract class _NaverSearchCafe implements NaverSearchCafe {
  factory _NaverSearchCafe(
      {required final String name,
      required final String roadAddress,
      required final String dongAddress,
      required final double latitude,
      required final double longitude}) = _$NaverSearchCafeImpl;

  @override
  String get name;
  @override
  String get roadAddress;
  @override
  String get dongAddress;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$NaverSearchCafeImplCopyWith<_$NaverSearchCafeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Location {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({String name, String imageUrl, double latitude, double longitude});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String imageUrl, double latitude, double longitude});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LocationImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$LocationImpl implements _Location {
  _$LocationImpl(
      {required this.name,
      required this.imageUrl,
      required this.latitude,
      required this.longitude});

  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'Location(name: $name, imageUrl: $imageUrl, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, imageUrl, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);
}

abstract class _Location implements Location {
  factory _Location(
      {required final String name,
      required final String imageUrl,
      required final double latitude,
      required final double longitude}) = _$LocationImpl;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
