// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CafeAdditionRequest {
  int get id => throw _privateConstructorUsedError;
  int get topFloor => throw _privateConstructorUsedError;
  int get bottomFloor => throw _privateConstructorUsedError;
  String get cafeName => throw _privateConstructorUsedError;
  String get dongAddress => throw _privateConstructorUsedError;
  String get roadAddress => throw _privateConstructorUsedError;
  String get etc => throw _privateConstructorUsedError;
  String? get rejectionReason => throw _privateConstructorUsedError;
  bool get isApproved => throw _privateConstructorUsedError;
  DateTime get requestedAt => throw _privateConstructorUsedError;
  DateTime get answeredAt => throw _privateConstructorUsedError;
  List<double> get wallSocketRates => throw _privateConstructorUsedError;
  OpeningHour? get openingHour => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CafeAdditionRequestCopyWith<CafeAdditionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeAdditionRequestCopyWith<$Res> {
  factory $CafeAdditionRequestCopyWith(
          CafeAdditionRequest value, $Res Function(CafeAdditionRequest) then) =
      _$CafeAdditionRequestCopyWithImpl<$Res, CafeAdditionRequest>;
  @useResult
  $Res call(
      {int id,
      int topFloor,
      int bottomFloor,
      String cafeName,
      String dongAddress,
      String roadAddress,
      String etc,
      String? rejectionReason,
      bool isApproved,
      DateTime requestedAt,
      DateTime answeredAt,
      List<double> wallSocketRates,
      OpeningHour? openingHour});

  $OpeningHourCopyWith<$Res>? get openingHour;
}

/// @nodoc
class _$CafeAdditionRequestCopyWithImpl<$Res, $Val extends CafeAdditionRequest>
    implements $CafeAdditionRequestCopyWith<$Res> {
  _$CafeAdditionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topFloor = null,
    Object? bottomFloor = null,
    Object? cafeName = null,
    Object? dongAddress = null,
    Object? roadAddress = null,
    Object? etc = null,
    Object? rejectionReason = freezed,
    Object? isApproved = null,
    Object? requestedAt = null,
    Object? answeredAt = null,
    Object? wallSocketRates = null,
    Object? openingHour = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      topFloor: null == topFloor
          ? _value.topFloor
          : topFloor // ignore: cast_nullable_to_non_nullable
              as int,
      bottomFloor: null == bottomFloor
          ? _value.bottomFloor
          : bottomFloor // ignore: cast_nullable_to_non_nullable
              as int,
      cafeName: null == cafeName
          ? _value.cafeName
          : cafeName // ignore: cast_nullable_to_non_nullable
              as String,
      dongAddress: null == dongAddress
          ? _value.dongAddress
          : dongAddress // ignore: cast_nullable_to_non_nullable
              as String,
      roadAddress: null == roadAddress
          ? _value.roadAddress
          : roadAddress // ignore: cast_nullable_to_non_nullable
              as String,
      etc: null == etc
          ? _value.etc
          : etc // ignore: cast_nullable_to_non_nullable
              as String,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      requestedAt: null == requestedAt
          ? _value.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      answeredAt: null == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wallSocketRates: null == wallSocketRates
          ? _value.wallSocketRates
          : wallSocketRates // ignore: cast_nullable_to_non_nullable
              as List<double>,
      openingHour: freezed == openingHour
          ? _value.openingHour
          : openingHour // ignore: cast_nullable_to_non_nullable
              as OpeningHour?,
    ) as $Val);
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
abstract class _$$CafeAdditionRequestImplCopyWith<$Res>
    implements $CafeAdditionRequestCopyWith<$Res> {
  factory _$$CafeAdditionRequestImplCopyWith(_$CafeAdditionRequestImpl value,
          $Res Function(_$CafeAdditionRequestImpl) then) =
      __$$CafeAdditionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int topFloor,
      int bottomFloor,
      String cafeName,
      String dongAddress,
      String roadAddress,
      String etc,
      String? rejectionReason,
      bool isApproved,
      DateTime requestedAt,
      DateTime answeredAt,
      List<double> wallSocketRates,
      OpeningHour? openingHour});

  @override
  $OpeningHourCopyWith<$Res>? get openingHour;
}

/// @nodoc
class __$$CafeAdditionRequestImplCopyWithImpl<$Res>
    extends _$CafeAdditionRequestCopyWithImpl<$Res, _$CafeAdditionRequestImpl>
    implements _$$CafeAdditionRequestImplCopyWith<$Res> {
  __$$CafeAdditionRequestImplCopyWithImpl(_$CafeAdditionRequestImpl _value,
      $Res Function(_$CafeAdditionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topFloor = null,
    Object? bottomFloor = null,
    Object? cafeName = null,
    Object? dongAddress = null,
    Object? roadAddress = null,
    Object? etc = null,
    Object? rejectionReason = freezed,
    Object? isApproved = null,
    Object? requestedAt = null,
    Object? answeredAt = null,
    Object? wallSocketRates = null,
    Object? openingHour = freezed,
  }) {
    return _then(_$CafeAdditionRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      topFloor: null == topFloor
          ? _value.topFloor
          : topFloor // ignore: cast_nullable_to_non_nullable
              as int,
      bottomFloor: null == bottomFloor
          ? _value.bottomFloor
          : bottomFloor // ignore: cast_nullable_to_non_nullable
              as int,
      cafeName: null == cafeName
          ? _value.cafeName
          : cafeName // ignore: cast_nullable_to_non_nullable
              as String,
      dongAddress: null == dongAddress
          ? _value.dongAddress
          : dongAddress // ignore: cast_nullable_to_non_nullable
              as String,
      roadAddress: null == roadAddress
          ? _value.roadAddress
          : roadAddress // ignore: cast_nullable_to_non_nullable
              as String,
      etc: null == etc
          ? _value.etc
          : etc // ignore: cast_nullable_to_non_nullable
              as String,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      requestedAt: null == requestedAt
          ? _value.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      answeredAt: null == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wallSocketRates: null == wallSocketRates
          ? _value._wallSocketRates
          : wallSocketRates // ignore: cast_nullable_to_non_nullable
              as List<double>,
      openingHour: freezed == openingHour
          ? _value.openingHour
          : openingHour // ignore: cast_nullable_to_non_nullable
              as OpeningHour?,
    ));
  }
}

/// @nodoc

class _$CafeAdditionRequestImpl implements _CafeAdditionRequest {
  _$CafeAdditionRequestImpl(
      {required this.id,
      required this.topFloor,
      required this.bottomFloor,
      required this.cafeName,
      required this.dongAddress,
      required this.roadAddress,
      required this.etc,
      required this.rejectionReason,
      required this.isApproved,
      required this.requestedAt,
      required this.answeredAt,
      required final List<double> wallSocketRates,
      required this.openingHour})
      : _wallSocketRates = wallSocketRates;

  @override
  final int id;
  @override
  final int topFloor;
  @override
  final int bottomFloor;
  @override
  final String cafeName;
  @override
  final String dongAddress;
  @override
  final String roadAddress;
  @override
  final String etc;
  @override
  final String? rejectionReason;
  @override
  final bool isApproved;
  @override
  final DateTime requestedAt;
  @override
  final DateTime answeredAt;
  final List<double> _wallSocketRates;
  @override
  List<double> get wallSocketRates {
    if (_wallSocketRates is EqualUnmodifiableListView) return _wallSocketRates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallSocketRates);
  }

  @override
  final OpeningHour? openingHour;

  @override
  String toString() {
    return 'CafeAdditionRequest(id: $id, topFloor: $topFloor, bottomFloor: $bottomFloor, cafeName: $cafeName, dongAddress: $dongAddress, roadAddress: $roadAddress, etc: $etc, rejectionReason: $rejectionReason, isApproved: $isApproved, requestedAt: $requestedAt, answeredAt: $answeredAt, wallSocketRates: $wallSocketRates, openingHour: $openingHour)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeAdditionRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.topFloor, topFloor) ||
                other.topFloor == topFloor) &&
            (identical(other.bottomFloor, bottomFloor) ||
                other.bottomFloor == bottomFloor) &&
            (identical(other.cafeName, cafeName) ||
                other.cafeName == cafeName) &&
            (identical(other.dongAddress, dongAddress) ||
                other.dongAddress == dongAddress) &&
            (identical(other.roadAddress, roadAddress) ||
                other.roadAddress == roadAddress) &&
            (identical(other.etc, etc) || other.etc == etc) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.requestedAt, requestedAt) ||
                other.requestedAt == requestedAt) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            const DeepCollectionEquality()
                .equals(other._wallSocketRates, _wallSocketRates) &&
            (identical(other.openingHour, openingHour) ||
                other.openingHour == openingHour));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      topFloor,
      bottomFloor,
      cafeName,
      dongAddress,
      roadAddress,
      etc,
      rejectionReason,
      isApproved,
      requestedAt,
      answeredAt,
      const DeepCollectionEquality().hash(_wallSocketRates),
      openingHour);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeAdditionRequestImplCopyWith<_$CafeAdditionRequestImpl> get copyWith =>
      __$$CafeAdditionRequestImplCopyWithImpl<_$CafeAdditionRequestImpl>(
          this, _$identity);
}

abstract class _CafeAdditionRequest implements CafeAdditionRequest {
  factory _CafeAdditionRequest(
      {required final int id,
      required final int topFloor,
      required final int bottomFloor,
      required final String cafeName,
      required final String dongAddress,
      required final String roadAddress,
      required final String etc,
      required final String? rejectionReason,
      required final bool isApproved,
      required final DateTime requestedAt,
      required final DateTime answeredAt,
      required final List<double> wallSocketRates,
      required final OpeningHour? openingHour}) = _$CafeAdditionRequestImpl;

  @override
  int get id;
  @override
  int get topFloor;
  @override
  int get bottomFloor;
  @override
  String get cafeName;
  @override
  String get dongAddress;
  @override
  String get roadAddress;
  @override
  String get etc;
  @override
  String? get rejectionReason;
  @override
  bool get isApproved;
  @override
  DateTime get requestedAt;
  @override
  DateTime get answeredAt;
  @override
  List<double> get wallSocketRates;
  @override
  OpeningHour? get openingHour;
  @override
  @JsonKey(ignore: true)
  _$$CafeAdditionRequestImplCopyWith<_$CafeAdditionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CafeModificationRequest {
  int get id => throw _privateConstructorUsedError;
  Cafe get cafe => throw _privateConstructorUsedError;
  bool get isApproved => throw _privateConstructorUsedError;
  DateTime get requestedAt => throw _privateConstructorUsedError;
  DateTime get answeredAt => throw _privateConstructorUsedError;
  String? get rejectionReason => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CafeModificationRequestCopyWith<CafeModificationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeModificationRequestCopyWith<$Res> {
  factory $CafeModificationRequestCopyWith(CafeModificationRequest value,
          $Res Function(CafeModificationRequest) then) =
      _$CafeModificationRequestCopyWithImpl<$Res, CafeModificationRequest>;
  @useResult
  $Res call(
      {int id,
      Cafe cafe,
      bool isApproved,
      DateTime requestedAt,
      DateTime answeredAt,
      String? rejectionReason});

  $CafeCopyWith<$Res> get cafe;
}

/// @nodoc
class _$CafeModificationRequestCopyWithImpl<$Res,
        $Val extends CafeModificationRequest>
    implements $CafeModificationRequestCopyWith<$Res> {
  _$CafeModificationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cafe = null,
    Object? isApproved = null,
    Object? requestedAt = null,
    Object? answeredAt = null,
    Object? rejectionReason = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cafe: null == cafe
          ? _value.cafe
          : cafe // ignore: cast_nullable_to_non_nullable
              as Cafe,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      requestedAt: null == requestedAt
          ? _value.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      answeredAt: null == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$CafeModificationRequestImplCopyWith<$Res>
    implements $CafeModificationRequestCopyWith<$Res> {
  factory _$$CafeModificationRequestImplCopyWith(
          _$CafeModificationRequestImpl value,
          $Res Function(_$CafeModificationRequestImpl) then) =
      __$$CafeModificationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Cafe cafe,
      bool isApproved,
      DateTime requestedAt,
      DateTime answeredAt,
      String? rejectionReason});

  @override
  $CafeCopyWith<$Res> get cafe;
}

/// @nodoc
class __$$CafeModificationRequestImplCopyWithImpl<$Res>
    extends _$CafeModificationRequestCopyWithImpl<$Res,
        _$CafeModificationRequestImpl>
    implements _$$CafeModificationRequestImplCopyWith<$Res> {
  __$$CafeModificationRequestImplCopyWithImpl(
      _$CafeModificationRequestImpl _value,
      $Res Function(_$CafeModificationRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cafe = null,
    Object? isApproved = null,
    Object? requestedAt = null,
    Object? answeredAt = null,
    Object? rejectionReason = freezed,
  }) {
    return _then(_$CafeModificationRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cafe: null == cafe
          ? _value.cafe
          : cafe // ignore: cast_nullable_to_non_nullable
              as Cafe,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      requestedAt: null == requestedAt
          ? _value.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      answeredAt: null == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CafeModificationRequestImpl implements _CafeModificationRequest {
  _$CafeModificationRequestImpl(
      {required this.id,
      required this.cafe,
      required this.isApproved,
      required this.requestedAt,
      required this.answeredAt,
      required this.rejectionReason});

  @override
  final int id;
  @override
  final Cafe cafe;
  @override
  final bool isApproved;
  @override
  final DateTime requestedAt;
  @override
  final DateTime answeredAt;
  @override
  final String? rejectionReason;

  @override
  String toString() {
    return 'CafeModificationRequest(id: $id, cafe: $cafe, isApproved: $isApproved, requestedAt: $requestedAt, answeredAt: $answeredAt, rejectionReason: $rejectionReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeModificationRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cafe, cafe) || other.cafe == cafe) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.requestedAt, requestedAt) ||
                other.requestedAt == requestedAt) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, cafe, isApproved,
      requestedAt, answeredAt, rejectionReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeModificationRequestImplCopyWith<_$CafeModificationRequestImpl>
      get copyWith => __$$CafeModificationRequestImplCopyWithImpl<
          _$CafeModificationRequestImpl>(this, _$identity);
}

abstract class _CafeModificationRequest implements CafeModificationRequest {
  factory _CafeModificationRequest(
      {required final int id,
      required final Cafe cafe,
      required final bool isApproved,
      required final DateTime requestedAt,
      required final DateTime answeredAt,
      required final String? rejectionReason}) = _$CafeModificationRequestImpl;

  @override
  int get id;
  @override
  Cafe get cafe;
  @override
  bool get isApproved;
  @override
  DateTime get requestedAt;
  @override
  DateTime get answeredAt;
  @override
  String? get rejectionReason;
  @override
  @JsonKey(ignore: true)
  _$$CafeModificationRequestImplCopyWith<_$CafeModificationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
