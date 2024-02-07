// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$User {
  int get userId => throw _privateConstructorUsedError;
  int get profileId => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isMarketingPushEnabled => throw _privateConstructorUsedError;
  bool get isOccupancyPushEnabled => throw _privateConstructorUsedError;
  bool get isLogPushEnabled => throw _privateConstructorUsedError;
  DateTime get dateJoined => throw _privateConstructorUsedError;
  DateTime get lastLogin => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get ageRange => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  CATI get myCATI => throw _privateConstructorUsedError;
  int? get gender => throw _privateConstructorUsedError;
  Grade get grade => throw _privateConstructorUsedError;
  List<Cafe> get favoriteCafes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int userId,
      int profileId,
      int point,
      bool isAdmin,
      bool isActive,
      bool isMarketingPushEnabled,
      bool isOccupancyPushEnabled,
      bool isLogPushEnabled,
      DateTime dateJoined,
      DateTime lastLogin,
      String nickname,
      String fcmToken,
      String imageUrl,
      String? email,
      String? phoneNumber,
      String? ageRange,
      String? dateOfBirth,
      CATI myCATI,
      int? gender,
      Grade grade,
      List<Cafe> favoriteCafes});

  $CATICopyWith<$Res> get myCATI;
  $GradeCopyWith<$Res> get grade;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? profileId = null,
    Object? point = null,
    Object? isAdmin = null,
    Object? isActive = null,
    Object? isMarketingPushEnabled = null,
    Object? isOccupancyPushEnabled = null,
    Object? isLogPushEnabled = null,
    Object? dateJoined = null,
    Object? lastLogin = null,
    Object? nickname = null,
    Object? fcmToken = null,
    Object? imageUrl = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? ageRange = freezed,
    Object? dateOfBirth = freezed,
    Object? myCATI = null,
    Object? gender = freezed,
    Object? grade = null,
    Object? favoriteCafes = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketingPushEnabled: null == isMarketingPushEnabled
          ? _value.isMarketingPushEnabled
          : isMarketingPushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isOccupancyPushEnabled: null == isOccupancyPushEnabled
          ? _value.isOccupancyPushEnabled
          : isOccupancyPushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogPushEnabled: null == isLogPushEnabled
          ? _value.isLogPushEnabled
          : isLogPushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dateJoined: null == dateJoined
          ? _value.dateJoined
          : dateJoined // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLogin: null == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      ageRange: freezed == ageRange
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      myCATI: null == myCATI
          ? _value.myCATI
          : myCATI // ignore: cast_nullable_to_non_nullable
              as CATI,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as Grade,
      favoriteCafes: null == favoriteCafes
          ? _value.favoriteCafes
          : favoriteCafes // ignore: cast_nullable_to_non_nullable
              as List<Cafe>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CATICopyWith<$Res> get myCATI {
    return $CATICopyWith<$Res>(_value.myCATI, (value) {
      return _then(_value.copyWith(myCATI: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GradeCopyWith<$Res> get grade {
    return $GradeCopyWith<$Res>(_value.grade, (value) {
      return _then(_value.copyWith(grade: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int userId,
      int profileId,
      int point,
      bool isAdmin,
      bool isActive,
      bool isMarketingPushEnabled,
      bool isOccupancyPushEnabled,
      bool isLogPushEnabled,
      DateTime dateJoined,
      DateTime lastLogin,
      String nickname,
      String fcmToken,
      String imageUrl,
      String? email,
      String? phoneNumber,
      String? ageRange,
      String? dateOfBirth,
      CATI myCATI,
      int? gender,
      Grade grade,
      List<Cafe> favoriteCafes});

  @override
  $CATICopyWith<$Res> get myCATI;
  @override
  $GradeCopyWith<$Res> get grade;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? profileId = null,
    Object? point = null,
    Object? isAdmin = null,
    Object? isActive = null,
    Object? isMarketingPushEnabled = null,
    Object? isOccupancyPushEnabled = null,
    Object? isLogPushEnabled = null,
    Object? dateJoined = null,
    Object? lastLogin = null,
    Object? nickname = null,
    Object? fcmToken = null,
    Object? imageUrl = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? ageRange = freezed,
    Object? dateOfBirth = freezed,
    Object? myCATI = null,
    Object? gender = freezed,
    Object? grade = null,
    Object? favoriteCafes = null,
  }) {
    return _then(_$UserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarketingPushEnabled: null == isMarketingPushEnabled
          ? _value.isMarketingPushEnabled
          : isMarketingPushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isOccupancyPushEnabled: null == isOccupancyPushEnabled
          ? _value.isOccupancyPushEnabled
          : isOccupancyPushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogPushEnabled: null == isLogPushEnabled
          ? _value.isLogPushEnabled
          : isLogPushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dateJoined: null == dateJoined
          ? _value.dateJoined
          : dateJoined // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLogin: null == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      ageRange: freezed == ageRange
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      myCATI: null == myCATI
          ? _value.myCATI
          : myCATI // ignore: cast_nullable_to_non_nullable
              as CATI,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as Grade,
      favoriteCafes: null == favoriteCafes
          ? _value._favoriteCafes
          : favoriteCafes // ignore: cast_nullable_to_non_nullable
              as List<Cafe>,
    ));
  }
}

/// @nodoc

class _$UserImpl implements _User {
  _$UserImpl(
      {required this.userId,
      required this.profileId,
      required this.point,
      required this.isAdmin,
      required this.isActive,
      required this.isMarketingPushEnabled,
      required this.isOccupancyPushEnabled,
      required this.isLogPushEnabled,
      required this.dateJoined,
      required this.lastLogin,
      required this.nickname,
      required this.fcmToken,
      required this.imageUrl,
      required this.email,
      required this.phoneNumber,
      required this.ageRange,
      required this.dateOfBirth,
      required this.myCATI,
      required this.gender,
      required this.grade,
      required final List<Cafe> favoriteCafes})
      : _favoriteCafes = favoriteCafes;

  @override
  final int userId;
  @override
  final int profileId;
  @override
  final int point;
  @override
  final bool isAdmin;
  @override
  final bool isActive;
  @override
  final bool isMarketingPushEnabled;
  @override
  final bool isOccupancyPushEnabled;
  @override
  final bool isLogPushEnabled;
  @override
  final DateTime dateJoined;
  @override
  final DateTime lastLogin;
  @override
  final String nickname;
  @override
  final String fcmToken;
  @override
  final String imageUrl;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? ageRange;
  @override
  final String? dateOfBirth;
  @override
  final CATI myCATI;
  @override
  final int? gender;
  @override
  final Grade grade;
  final List<Cafe> _favoriteCafes;
  @override
  List<Cafe> get favoriteCafes {
    if (_favoriteCafes is EqualUnmodifiableListView) return _favoriteCafes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteCafes);
  }

  @override
  String toString() {
    return 'User(userId: $userId, profileId: $profileId, point: $point, isAdmin: $isAdmin, isActive: $isActive, isMarketingPushEnabled: $isMarketingPushEnabled, isOccupancyPushEnabled: $isOccupancyPushEnabled, isLogPushEnabled: $isLogPushEnabled, dateJoined: $dateJoined, lastLogin: $lastLogin, nickname: $nickname, fcmToken: $fcmToken, imageUrl: $imageUrl, email: $email, phoneNumber: $phoneNumber, ageRange: $ageRange, dateOfBirth: $dateOfBirth, myCATI: $myCATI, gender: $gender, grade: $grade, favoriteCafes: $favoriteCafes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isMarketingPushEnabled, isMarketingPushEnabled) ||
                other.isMarketingPushEnabled == isMarketingPushEnabled) &&
            (identical(other.isOccupancyPushEnabled, isOccupancyPushEnabled) ||
                other.isOccupancyPushEnabled == isOccupancyPushEnabled) &&
            (identical(other.isLogPushEnabled, isLogPushEnabled) ||
                other.isLogPushEnabled == isLogPushEnabled) &&
            (identical(other.dateJoined, dateJoined) ||
                other.dateJoined == dateJoined) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.ageRange, ageRange) ||
                other.ageRange == ageRange) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.myCATI, myCATI) || other.myCATI == myCATI) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            const DeepCollectionEquality()
                .equals(other._favoriteCafes, _favoriteCafes));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        profileId,
        point,
        isAdmin,
        isActive,
        isMarketingPushEnabled,
        isOccupancyPushEnabled,
        isLogPushEnabled,
        dateJoined,
        lastLogin,
        nickname,
        fcmToken,
        imageUrl,
        email,
        phoneNumber,
        ageRange,
        dateOfBirth,
        myCATI,
        gender,
        grade,
        const DeepCollectionEquality().hash(_favoriteCafes)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);
}

abstract class _User implements User {
  factory _User(
      {required final int userId,
      required final int profileId,
      required final int point,
      required final bool isAdmin,
      required final bool isActive,
      required final bool isMarketingPushEnabled,
      required final bool isOccupancyPushEnabled,
      required final bool isLogPushEnabled,
      required final DateTime dateJoined,
      required final DateTime lastLogin,
      required final String nickname,
      required final String fcmToken,
      required final String imageUrl,
      required final String? email,
      required final String? phoneNumber,
      required final String? ageRange,
      required final String? dateOfBirth,
      required final CATI myCATI,
      required final int? gender,
      required final Grade grade,
      required final List<Cafe> favoriteCafes}) = _$UserImpl;

  @override
  int get userId;
  @override
  int get profileId;
  @override
  int get point;
  @override
  bool get isAdmin;
  @override
  bool get isActive;
  @override
  bool get isMarketingPushEnabled;
  @override
  bool get isOccupancyPushEnabled;
  @override
  bool get isLogPushEnabled;
  @override
  DateTime get dateJoined;
  @override
  DateTime get lastLogin;
  @override
  String get nickname;
  @override
  String get fcmToken;
  @override
  String get imageUrl;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get ageRange;
  @override
  String? get dateOfBirth;
  @override
  CATI get myCATI;
  @override
  int? get gender;
  @override
  Grade get grade;
  @override
  List<Cafe> get favoriteCafes;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PartialUser {
  int get userId => throw _privateConstructorUsedError;
  int get profileId => throw _privateConstructorUsedError;
  int get updateCount => throw _privateConstructorUsedError;
  DateTime get dateJoined => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  Grade get grade => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PartialUserCopyWith<PartialUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartialUserCopyWith<$Res> {
  factory $PartialUserCopyWith(
          PartialUser value, $Res Function(PartialUser) then) =
      _$PartialUserCopyWithImpl<$Res, PartialUser>;
  @useResult
  $Res call(
      {int userId,
      int profileId,
      int updateCount,
      DateTime dateJoined,
      String imageUrl,
      String nickname,
      Grade grade});

  $GradeCopyWith<$Res> get grade;
}

/// @nodoc
class _$PartialUserCopyWithImpl<$Res, $Val extends PartialUser>
    implements $PartialUserCopyWith<$Res> {
  _$PartialUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? profileId = null,
    Object? updateCount = null,
    Object? dateJoined = null,
    Object? imageUrl = null,
    Object? nickname = null,
    Object? grade = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      updateCount: null == updateCount
          ? _value.updateCount
          : updateCount // ignore: cast_nullable_to_non_nullable
              as int,
      dateJoined: null == dateJoined
          ? _value.dateJoined
          : dateJoined // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as Grade,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GradeCopyWith<$Res> get grade {
    return $GradeCopyWith<$Res>(_value.grade, (value) {
      return _then(_value.copyWith(grade: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PartialUserImplCopyWith<$Res>
    implements $PartialUserCopyWith<$Res> {
  factory _$$PartialUserImplCopyWith(
          _$PartialUserImpl value, $Res Function(_$PartialUserImpl) then) =
      __$$PartialUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int userId,
      int profileId,
      int updateCount,
      DateTime dateJoined,
      String imageUrl,
      String nickname,
      Grade grade});

  @override
  $GradeCopyWith<$Res> get grade;
}

/// @nodoc
class __$$PartialUserImplCopyWithImpl<$Res>
    extends _$PartialUserCopyWithImpl<$Res, _$PartialUserImpl>
    implements _$$PartialUserImplCopyWith<$Res> {
  __$$PartialUserImplCopyWithImpl(
      _$PartialUserImpl _value, $Res Function(_$PartialUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? profileId = null,
    Object? updateCount = null,
    Object? dateJoined = null,
    Object? imageUrl = null,
    Object? nickname = null,
    Object? grade = null,
  }) {
    return _then(_$PartialUserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      updateCount: null == updateCount
          ? _value.updateCount
          : updateCount // ignore: cast_nullable_to_non_nullable
              as int,
      dateJoined: null == dateJoined
          ? _value.dateJoined
          : dateJoined // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as Grade,
    ));
  }
}

/// @nodoc

class _$PartialUserImpl implements _PartialUser {
  _$PartialUserImpl(
      {required this.userId,
      required this.profileId,
      required this.updateCount,
      required this.dateJoined,
      required this.imageUrl,
      required this.nickname,
      required this.grade});

  @override
  final int userId;
  @override
  final int profileId;
  @override
  final int updateCount;
  @override
  final DateTime dateJoined;
  @override
  final String imageUrl;
  @override
  final String nickname;
  @override
  final Grade grade;

  @override
  String toString() {
    return 'PartialUser(userId: $userId, profileId: $profileId, updateCount: $updateCount, dateJoined: $dateJoined, imageUrl: $imageUrl, nickname: $nickname, grade: $grade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartialUserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.updateCount, updateCount) ||
                other.updateCount == updateCount) &&
            (identical(other.dateJoined, dateJoined) ||
                other.dateJoined == dateJoined) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.grade, grade) || other.grade == grade));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, profileId, updateCount,
      dateJoined, imageUrl, nickname, grade);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartialUserImplCopyWith<_$PartialUserImpl> get copyWith =>
      __$$PartialUserImplCopyWithImpl<_$PartialUserImpl>(this, _$identity);
}

abstract class _PartialUser implements PartialUser {
  factory _PartialUser(
      {required final int userId,
      required final int profileId,
      required final int updateCount,
      required final DateTime dateJoined,
      required final String imageUrl,
      required final String nickname,
      required final Grade grade}) = _$PartialUserImpl;

  @override
  int get userId;
  @override
  int get profileId;
  @override
  int get updateCount;
  @override
  DateTime get dateJoined;
  @override
  String get imageUrl;
  @override
  String get nickname;
  @override
  Grade get grade;
  @override
  @JsonKey(ignore: true)
  _$$PartialUserImplCopyWith<_$PartialUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Grade {
  int get id => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  int get updateCountRequirement => throw _privateConstructorUsedError;
  int get updateRestrictionPerCafe => throw _privateConstructorUsedError;
  int get stackRestrictionPerDay => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GradeCopyWith<Grade> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradeCopyWith<$Res> {
  factory $GradeCopyWith(Grade value, $Res Function(Grade) then) =
      _$GradeCopyWithImpl<$Res, Grade>;
  @useResult
  $Res call(
      {int id,
      int step,
      int updateCountRequirement,
      int updateRestrictionPerCafe,
      int stackRestrictionPerDay,
      String name,
      String imageUrl,
      String description});
}

/// @nodoc
class _$GradeCopyWithImpl<$Res, $Val extends Grade>
    implements $GradeCopyWith<$Res> {
  _$GradeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? step = null,
    Object? updateCountRequirement = null,
    Object? updateRestrictionPerCafe = null,
    Object? stackRestrictionPerDay = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      updateCountRequirement: null == updateCountRequirement
          ? _value.updateCountRequirement
          : updateCountRequirement // ignore: cast_nullable_to_non_nullable
              as int,
      updateRestrictionPerCafe: null == updateRestrictionPerCafe
          ? _value.updateRestrictionPerCafe
          : updateRestrictionPerCafe // ignore: cast_nullable_to_non_nullable
              as int,
      stackRestrictionPerDay: null == stackRestrictionPerDay
          ? _value.stackRestrictionPerDay
          : stackRestrictionPerDay // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GradeImplCopyWith<$Res> implements $GradeCopyWith<$Res> {
  factory _$$GradeImplCopyWith(
          _$GradeImpl value, $Res Function(_$GradeImpl) then) =
      __$$GradeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int step,
      int updateCountRequirement,
      int updateRestrictionPerCafe,
      int stackRestrictionPerDay,
      String name,
      String imageUrl,
      String description});
}

/// @nodoc
class __$$GradeImplCopyWithImpl<$Res>
    extends _$GradeCopyWithImpl<$Res, _$GradeImpl>
    implements _$$GradeImplCopyWith<$Res> {
  __$$GradeImplCopyWithImpl(
      _$GradeImpl _value, $Res Function(_$GradeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? step = null,
    Object? updateCountRequirement = null,
    Object? updateRestrictionPerCafe = null,
    Object? stackRestrictionPerDay = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? description = null,
  }) {
    return _then(_$GradeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      updateCountRequirement: null == updateCountRequirement
          ? _value.updateCountRequirement
          : updateCountRequirement // ignore: cast_nullable_to_non_nullable
              as int,
      updateRestrictionPerCafe: null == updateRestrictionPerCafe
          ? _value.updateRestrictionPerCafe
          : updateRestrictionPerCafe // ignore: cast_nullable_to_non_nullable
              as int,
      stackRestrictionPerDay: null == stackRestrictionPerDay
          ? _value.stackRestrictionPerDay
          : stackRestrictionPerDay // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GradeImpl implements _Grade {
  _$GradeImpl(
      {required this.id,
      required this.step,
      required this.updateCountRequirement,
      required this.updateRestrictionPerCafe,
      required this.stackRestrictionPerDay,
      required this.name,
      required this.imageUrl,
      required this.description});

  @override
  final int id;
  @override
  final int step;
  @override
  final int updateCountRequirement;
  @override
  final int updateRestrictionPerCafe;
  @override
  final int stackRestrictionPerDay;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String description;

  @override
  String toString() {
    return 'Grade(id: $id, step: $step, updateCountRequirement: $updateCountRequirement, updateRestrictionPerCafe: $updateRestrictionPerCafe, stackRestrictionPerDay: $stackRestrictionPerDay, name: $name, imageUrl: $imageUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GradeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.updateCountRequirement, updateCountRequirement) ||
                other.updateCountRequirement == updateCountRequirement) &&
            (identical(
                    other.updateRestrictionPerCafe, updateRestrictionPerCafe) ||
                other.updateRestrictionPerCafe == updateRestrictionPerCafe) &&
            (identical(other.stackRestrictionPerDay, stackRestrictionPerDay) ||
                other.stackRestrictionPerDay == stackRestrictionPerDay) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      step,
      updateCountRequirement,
      updateRestrictionPerCafe,
      stackRestrictionPerDay,
      name,
      imageUrl,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GradeImplCopyWith<_$GradeImpl> get copyWith =>
      __$$GradeImplCopyWithImpl<_$GradeImpl>(this, _$identity);
}

abstract class _Grade implements Grade {
  factory _Grade(
      {required final int id,
      required final int step,
      required final int updateCountRequirement,
      required final int updateRestrictionPerCafe,
      required final int stackRestrictionPerDay,
      required final String name,
      required final String imageUrl,
      required final String description}) = _$GradeImpl;

  @override
  int get id;
  @override
  int get step;
  @override
  int get updateCountRequirement;
  @override
  int get updateRestrictionPerCafe;
  @override
  int get stackRestrictionPerDay;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$GradeImplCopyWith<_$GradeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
