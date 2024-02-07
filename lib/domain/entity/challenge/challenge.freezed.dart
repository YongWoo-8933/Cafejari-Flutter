// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Challenge {
  int get id => throw _privateConstructorUsedError;
  int get participantLimit => throw _privateConstructorUsedError;
  int get goal => throw _privateConstructorUsedError;
  int get totalPoint => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  DateTime get startAt => throw _privateConstructorUsedError;
  DateTime get finishAt => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;
  List<int> get challengerUserIds => throw _privateConstructorUsedError;
  List<String> get challengerProfileImages =>
      throw _privateConstructorUsedError;
  List<ChallengeMilestone> get challengeMilestones =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChallengeCopyWith<Challenge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeCopyWith<$Res> {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) then) =
      _$ChallengeCopyWithImpl<$Res, Challenge>;
  @useResult
  $Res call(
      {int id,
      int participantLimit,
      int goal,
      int totalPoint,
      String name,
      String description,
      String imageUrl,
      String url,
      DateTime startAt,
      DateTime finishAt,
      bool available,
      List<int> challengerUserIds,
      List<String> challengerProfileImages,
      List<ChallengeMilestone> challengeMilestones});
}

/// @nodoc
class _$ChallengeCopyWithImpl<$Res, $Val extends Challenge>
    implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? participantLimit = null,
    Object? goal = null,
    Object? totalPoint = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? url = null,
    Object? startAt = null,
    Object? finishAt = null,
    Object? available = null,
    Object? challengerUserIds = null,
    Object? challengerProfileImages = null,
    Object? challengeMilestones = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      participantLimit: null == participantLimit
          ? _value.participantLimit
          : participantLimit // ignore: cast_nullable_to_non_nullable
              as int,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoint: null == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
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
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      finishAt: null == finishAt
          ? _value.finishAt
          : finishAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      challengerUserIds: null == challengerUserIds
          ? _value.challengerUserIds
          : challengerUserIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      challengerProfileImages: null == challengerProfileImages
          ? _value.challengerProfileImages
          : challengerProfileImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      challengeMilestones: null == challengeMilestones
          ? _value.challengeMilestones
          : challengeMilestones // ignore: cast_nullable_to_non_nullable
              as List<ChallengeMilestone>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeImplCopyWith<$Res>
    implements $ChallengeCopyWith<$Res> {
  factory _$$ChallengeImplCopyWith(
          _$ChallengeImpl value, $Res Function(_$ChallengeImpl) then) =
      __$$ChallengeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int participantLimit,
      int goal,
      int totalPoint,
      String name,
      String description,
      String imageUrl,
      String url,
      DateTime startAt,
      DateTime finishAt,
      bool available,
      List<int> challengerUserIds,
      List<String> challengerProfileImages,
      List<ChallengeMilestone> challengeMilestones});
}

/// @nodoc
class __$$ChallengeImplCopyWithImpl<$Res>
    extends _$ChallengeCopyWithImpl<$Res, _$ChallengeImpl>
    implements _$$ChallengeImplCopyWith<$Res> {
  __$$ChallengeImplCopyWithImpl(
      _$ChallengeImpl _value, $Res Function(_$ChallengeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? participantLimit = null,
    Object? goal = null,
    Object? totalPoint = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? url = null,
    Object? startAt = null,
    Object? finishAt = null,
    Object? available = null,
    Object? challengerUserIds = null,
    Object? challengerProfileImages = null,
    Object? challengeMilestones = null,
  }) {
    return _then(_$ChallengeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      participantLimit: null == participantLimit
          ? _value.participantLimit
          : participantLimit // ignore: cast_nullable_to_non_nullable
              as int,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoint: null == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
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
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      finishAt: null == finishAt
          ? _value.finishAt
          : finishAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      challengerUserIds: null == challengerUserIds
          ? _value._challengerUserIds
          : challengerUserIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      challengerProfileImages: null == challengerProfileImages
          ? _value._challengerProfileImages
          : challengerProfileImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      challengeMilestones: null == challengeMilestones
          ? _value._challengeMilestones
          : challengeMilestones // ignore: cast_nullable_to_non_nullable
              as List<ChallengeMilestone>,
    ));
  }
}

/// @nodoc

class _$ChallengeImpl implements _Challenge {
  _$ChallengeImpl(
      {required this.id,
      required this.participantLimit,
      required this.goal,
      required this.totalPoint,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.url,
      required this.startAt,
      required this.finishAt,
      required this.available,
      required final List<int> challengerUserIds,
      required final List<String> challengerProfileImages,
      required final List<ChallengeMilestone> challengeMilestones})
      : _challengerUserIds = challengerUserIds,
        _challengerProfileImages = challengerProfileImages,
        _challengeMilestones = challengeMilestones;

  @override
  final int id;
  @override
  final int participantLimit;
  @override
  final int goal;
  @override
  final int totalPoint;
  @override
  final String name;
  @override
  final String description;
  @override
  final String imageUrl;
  @override
  final String url;
  @override
  final DateTime startAt;
  @override
  final DateTime finishAt;
  @override
  final bool available;
  final List<int> _challengerUserIds;
  @override
  List<int> get challengerUserIds {
    if (_challengerUserIds is EqualUnmodifiableListView)
      return _challengerUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challengerUserIds);
  }

  final List<String> _challengerProfileImages;
  @override
  List<String> get challengerProfileImages {
    if (_challengerProfileImages is EqualUnmodifiableListView)
      return _challengerProfileImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challengerProfileImages);
  }

  final List<ChallengeMilestone> _challengeMilestones;
  @override
  List<ChallengeMilestone> get challengeMilestones {
    if (_challengeMilestones is EqualUnmodifiableListView)
      return _challengeMilestones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challengeMilestones);
  }

  @override
  String toString() {
    return 'Challenge(id: $id, participantLimit: $participantLimit, goal: $goal, totalPoint: $totalPoint, name: $name, description: $description, imageUrl: $imageUrl, url: $url, startAt: $startAt, finishAt: $finishAt, available: $available, challengerUserIds: $challengerUserIds, challengerProfileImages: $challengerProfileImages, challengeMilestones: $challengeMilestones)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.participantLimit, participantLimit) ||
                other.participantLimit == participantLimit) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.totalPoint, totalPoint) ||
                other.totalPoint == totalPoint) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.finishAt, finishAt) ||
                other.finishAt == finishAt) &&
            (identical(other.available, available) ||
                other.available == available) &&
            const DeepCollectionEquality()
                .equals(other._challengerUserIds, _challengerUserIds) &&
            const DeepCollectionEquality().equals(
                other._challengerProfileImages, _challengerProfileImages) &&
            const DeepCollectionEquality()
                .equals(other._challengeMilestones, _challengeMilestones));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      participantLimit,
      goal,
      totalPoint,
      name,
      description,
      imageUrl,
      url,
      startAt,
      finishAt,
      available,
      const DeepCollectionEquality().hash(_challengerUserIds),
      const DeepCollectionEquality().hash(_challengerProfileImages),
      const DeepCollectionEquality().hash(_challengeMilestones));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeImplCopyWith<_$ChallengeImpl> get copyWith =>
      __$$ChallengeImplCopyWithImpl<_$ChallengeImpl>(this, _$identity);
}

abstract class _Challenge implements Challenge {
  factory _Challenge(
          {required final int id,
          required final int participantLimit,
          required final int goal,
          required final int totalPoint,
          required final String name,
          required final String description,
          required final String imageUrl,
          required final String url,
          required final DateTime startAt,
          required final DateTime finishAt,
          required final bool available,
          required final List<int> challengerUserIds,
          required final List<String> challengerProfileImages,
          required final List<ChallengeMilestone> challengeMilestones}) =
      _$ChallengeImpl;

  @override
  int get id;
  @override
  int get participantLimit;
  @override
  int get goal;
  @override
  int get totalPoint;
  @override
  String get name;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  String get url;
  @override
  DateTime get startAt;
  @override
  DateTime get finishAt;
  @override
  bool get available;
  @override
  List<int> get challengerUserIds;
  @override
  List<String> get challengerProfileImages;
  @override
  List<ChallengeMilestone> get challengeMilestones;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeImplCopyWith<_$ChallengeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChallengeMilestone {
  int get id => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get progressRate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChallengeMilestoneCopyWith<ChallengeMilestone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeMilestoneCopyWith<$Res> {
  factory $ChallengeMilestoneCopyWith(
          ChallengeMilestone value, $Res Function(ChallengeMilestone) then) =
      _$ChallengeMilestoneCopyWithImpl<$Res, ChallengeMilestone>;
  @useResult
  $Res call(
      {int id, int point, int count, double progressRate, String description});
}

/// @nodoc
class _$ChallengeMilestoneCopyWithImpl<$Res, $Val extends ChallengeMilestone>
    implements $ChallengeMilestoneCopyWith<$Res> {
  _$ChallengeMilestoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? point = null,
    Object? count = null,
    Object? progressRate = null,
    Object? description = null,
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
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      progressRate: null == progressRate
          ? _value.progressRate
          : progressRate // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeMilestoneImplCopyWith<$Res>
    implements $ChallengeMilestoneCopyWith<$Res> {
  factory _$$ChallengeMilestoneImplCopyWith(_$ChallengeMilestoneImpl value,
          $Res Function(_$ChallengeMilestoneImpl) then) =
      __$$ChallengeMilestoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int point, int count, double progressRate, String description});
}

/// @nodoc
class __$$ChallengeMilestoneImplCopyWithImpl<$Res>
    extends _$ChallengeMilestoneCopyWithImpl<$Res, _$ChallengeMilestoneImpl>
    implements _$$ChallengeMilestoneImplCopyWith<$Res> {
  __$$ChallengeMilestoneImplCopyWithImpl(_$ChallengeMilestoneImpl _value,
      $Res Function(_$ChallengeMilestoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? point = null,
    Object? count = null,
    Object? progressRate = null,
    Object? description = null,
  }) {
    return _then(_$ChallengeMilestoneImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      progressRate: null == progressRate
          ? _value.progressRate
          : progressRate // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChallengeMilestoneImpl implements _ChallengeMilestone {
  _$ChallengeMilestoneImpl(
      {required this.id,
      required this.point,
      required this.count,
      required this.progressRate,
      required this.description});

  @override
  final int id;
  @override
  final int point;
  @override
  final int count;
  @override
  final double progressRate;
  @override
  final String description;

  @override
  String toString() {
    return 'ChallengeMilestone(id: $id, point: $point, count: $count, progressRate: $progressRate, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeMilestoneImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.progressRate, progressRate) ||
                other.progressRate == progressRate) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, point, count, progressRate, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeMilestoneImplCopyWith<_$ChallengeMilestoneImpl> get copyWith =>
      __$$ChallengeMilestoneImplCopyWithImpl<_$ChallengeMilestoneImpl>(
          this, _$identity);
}

abstract class _ChallengeMilestone implements ChallengeMilestone {
  factory _ChallengeMilestone(
      {required final int id,
      required final int point,
      required final int count,
      required final double progressRate,
      required final String description}) = _$ChallengeMilestoneImpl;

  @override
  int get id;
  @override
  int get point;
  @override
  int get count;
  @override
  double get progressRate;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeMilestoneImplCopyWith<_$ChallengeMilestoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Challenger {
  int get id => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get progressRate => throw _privateConstructorUsedError;
  Challenge get challenge => throw _privateConstructorUsedError;
  List<ChallengePoint> get points => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChallengerCopyWith<Challenger> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengerCopyWith<$Res> {
  factory $ChallengerCopyWith(
          Challenger value, $Res Function(Challenger) then) =
      _$ChallengerCopyWithImpl<$Res, Challenger>;
  @useResult
  $Res call(
      {int id,
      int count,
      double progressRate,
      Challenge challenge,
      List<ChallengePoint> points});

  $ChallengeCopyWith<$Res> get challenge;
}

/// @nodoc
class _$ChallengerCopyWithImpl<$Res, $Val extends Challenger>
    implements $ChallengerCopyWith<$Res> {
  _$ChallengerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? count = null,
    Object? progressRate = null,
    Object? challenge = null,
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      progressRate: null == progressRate
          ? _value.progressRate
          : progressRate // ignore: cast_nullable_to_non_nullable
              as double,
      challenge: null == challenge
          ? _value.challenge
          : challenge // ignore: cast_nullable_to_non_nullable
              as Challenge,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<ChallengePoint>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChallengeCopyWith<$Res> get challenge {
    return $ChallengeCopyWith<$Res>(_value.challenge, (value) {
      return _then(_value.copyWith(challenge: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChallengerImplCopyWith<$Res>
    implements $ChallengerCopyWith<$Res> {
  factory _$$ChallengerImplCopyWith(
          _$ChallengerImpl value, $Res Function(_$ChallengerImpl) then) =
      __$$ChallengerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int count,
      double progressRate,
      Challenge challenge,
      List<ChallengePoint> points});

  @override
  $ChallengeCopyWith<$Res> get challenge;
}

/// @nodoc
class __$$ChallengerImplCopyWithImpl<$Res>
    extends _$ChallengerCopyWithImpl<$Res, _$ChallengerImpl>
    implements _$$ChallengerImplCopyWith<$Res> {
  __$$ChallengerImplCopyWithImpl(
      _$ChallengerImpl _value, $Res Function(_$ChallengerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? count = null,
    Object? progressRate = null,
    Object? challenge = null,
    Object? points = null,
  }) {
    return _then(_$ChallengerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      progressRate: null == progressRate
          ? _value.progressRate
          : progressRate // ignore: cast_nullable_to_non_nullable
              as double,
      challenge: null == challenge
          ? _value.challenge
          : challenge // ignore: cast_nullable_to_non_nullable
              as Challenge,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<ChallengePoint>,
    ));
  }
}

/// @nodoc

class _$ChallengerImpl implements _Challenger {
  _$ChallengerImpl(
      {required this.id,
      required this.count,
      required this.progressRate,
      required this.challenge,
      required final List<ChallengePoint> points})
      : _points = points;

  @override
  final int id;
  @override
  final int count;
  @override
  final double progressRate;
  @override
  final Challenge challenge;
  final List<ChallengePoint> _points;
  @override
  List<ChallengePoint> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  String toString() {
    return 'Challenger(id: $id, count: $count, progressRate: $progressRate, challenge: $challenge, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.progressRate, progressRate) ||
                other.progressRate == progressRate) &&
            (identical(other.challenge, challenge) ||
                other.challenge == challenge) &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, count, progressRate,
      challenge, const DeepCollectionEquality().hash(_points));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengerImplCopyWith<_$ChallengerImpl> get copyWith =>
      __$$ChallengerImplCopyWithImpl<_$ChallengerImpl>(this, _$identity);
}

abstract class _Challenger implements Challenger {
  factory _Challenger(
      {required final int id,
      required final int count,
      required final double progressRate,
      required final Challenge challenge,
      required final List<ChallengePoint> points}) = _$ChallengerImpl;

  @override
  int get id;
  @override
  int get count;
  @override
  double get progressRate;
  @override
  Challenge get challenge;
  @override
  List<ChallengePoint> get points;
  @override
  @JsonKey(ignore: true)
  _$$ChallengerImplCopyWith<_$ChallengerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChallengePoint {
  int get id => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get rewardedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChallengePointCopyWith<ChallengePoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengePointCopyWith<$Res> {
  factory $ChallengePointCopyWith(
          ChallengePoint value, $Res Function(ChallengePoint) then) =
      _$ChallengePointCopyWithImpl<$Res, ChallengePoint>;
  @useResult
  $Res call({int id, int point, String description, DateTime rewardedAt});
}

/// @nodoc
class _$ChallengePointCopyWithImpl<$Res, $Val extends ChallengePoint>
    implements $ChallengePointCopyWith<$Res> {
  _$ChallengePointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? point = null,
    Object? description = null,
    Object? rewardedAt = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rewardedAt: null == rewardedAt
          ? _value.rewardedAt
          : rewardedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengePointImplCopyWith<$Res>
    implements $ChallengePointCopyWith<$Res> {
  factory _$$ChallengePointImplCopyWith(_$ChallengePointImpl value,
          $Res Function(_$ChallengePointImpl) then) =
      __$$ChallengePointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int point, String description, DateTime rewardedAt});
}

/// @nodoc
class __$$ChallengePointImplCopyWithImpl<$Res>
    extends _$ChallengePointCopyWithImpl<$Res, _$ChallengePointImpl>
    implements _$$ChallengePointImplCopyWith<$Res> {
  __$$ChallengePointImplCopyWithImpl(
      _$ChallengePointImpl _value, $Res Function(_$ChallengePointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? point = null,
    Object? description = null,
    Object? rewardedAt = null,
  }) {
    return _then(_$ChallengePointImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rewardedAt: null == rewardedAt
          ? _value.rewardedAt
          : rewardedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChallengePointImpl implements _ChallengePoint {
  _$ChallengePointImpl(
      {required this.id,
      required this.point,
      required this.description,
      required this.rewardedAt});

  @override
  final int id;
  @override
  final int point;
  @override
  final String description;
  @override
  final DateTime rewardedAt;

  @override
  String toString() {
    return 'ChallengePoint(id: $id, point: $point, description: $description, rewardedAt: $rewardedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengePointImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rewardedAt, rewardedAt) ||
                other.rewardedAt == rewardedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, point, description, rewardedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengePointImplCopyWith<_$ChallengePointImpl> get copyWith =>
      __$$ChallengePointImplCopyWithImpl<_$ChallengePointImpl>(
          this, _$identity);
}

abstract class _ChallengePoint implements ChallengePoint {
  factory _ChallengePoint(
      {required final int id,
      required final int point,
      required final String description,
      required final DateTime rewardedAt}) = _$ChallengePointImpl;

  @override
  int get id;
  @override
  int get point;
  @override
  String get description;
  @override
  DateTime get rewardedAt;
  @override
  @JsonKey(ignore: true)
  _$$ChallengePointImplCopyWith<_$ChallengePointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
