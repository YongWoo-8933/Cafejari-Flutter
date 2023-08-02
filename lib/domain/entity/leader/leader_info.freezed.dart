// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leader_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LeaderInfo {
  int get id => throw _privateConstructorUsedError;
  int get activity => throw _privateConstructorUsedError;
  int get ranking => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeaderInfoCopyWith<LeaderInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderInfoCopyWith<$Res> {
  factory $LeaderInfoCopyWith(
          LeaderInfo value, $Res Function(LeaderInfo) then) =
      _$LeaderInfoCopyWithImpl<$Res, LeaderInfo>;
  @useResult
  $Res call(
      {int id, int activity, int ranking, String? nickname, String? image});
}

/// @nodoc
class _$LeaderInfoCopyWithImpl<$Res, $Val extends LeaderInfo>
    implements $LeaderInfoCopyWith<$Res> {
  _$LeaderInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? activity = null,
    Object? ranking = null,
    Object? nickname = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as int,
      ranking: null == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LeaderInfoCopyWith<$Res>
    implements $LeaderInfoCopyWith<$Res> {
  factory _$$_LeaderInfoCopyWith(
          _$_LeaderInfo value, $Res Function(_$_LeaderInfo) then) =
      __$$_LeaderInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int activity, int ranking, String? nickname, String? image});
}

/// @nodoc
class __$$_LeaderInfoCopyWithImpl<$Res>
    extends _$LeaderInfoCopyWithImpl<$Res, _$_LeaderInfo>
    implements _$$_LeaderInfoCopyWith<$Res> {
  __$$_LeaderInfoCopyWithImpl(
      _$_LeaderInfo _value, $Res Function(_$_LeaderInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? activity = null,
    Object? ranking = null,
    Object? nickname = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_LeaderInfo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as int,
      ranking: null == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LeaderInfo implements _LeaderInfo {
  _$_LeaderInfo(
      {required this.id,
      required this.activity,
      required this.ranking,
      required this.nickname,
      required this.image});

  @override
  final int id;
  @override
  final int activity;
  @override
  final int ranking;
  @override
  final String? nickname;
  @override
  final String? image;

  @override
  String toString() {
    return 'LeaderInfo(id: $id, activity: $activity, ranking: $ranking, nickname: $nickname, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LeaderInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.ranking, ranking) || other.ranking == ranking) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, activity, ranking, nickname, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeaderInfoCopyWith<_$_LeaderInfo> get copyWith =>
      __$$_LeaderInfoCopyWithImpl<_$_LeaderInfo>(this, _$identity);
}

abstract class _LeaderInfo implements LeaderInfo {
  factory _LeaderInfo(
      {required final int id,
      required final int activity,
      required final int ranking,
      required final String? nickname,
      required final String? image}) = _$_LeaderInfo;

  @override
  int get id;
  @override
  int get activity;
  @override
  int get ranking;
  @override
  String? get nickname;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_LeaderInfoCopyWith<_$_LeaderInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
