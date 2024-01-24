// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cafe_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CafeLog {
  int get id => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  CafeLogTheme get theme => throw _privateConstructorUsedError;
  PartialUser get user => throw _privateConstructorUsedError;
  Cafe get cafe => throw _privateConstructorUsedError;
  List<int> get likeUserIds => throw _privateConstructorUsedError;
  List<int> get reportUserIds => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CafeLogCopyWith<CafeLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeLogCopyWith<$Res> {
  factory $CafeLogCopyWith(CafeLog value, $Res Function(CafeLog) then) =
      _$CafeLogCopyWithImpl<$Res, CafeLog>;
  @useResult
  $Res call(
      {int id,
      bool isVisible,
      bool isPrivate,
      String content,
      DateTime createdAt,
      DateTime updatedAt,
      CafeLogTheme theme,
      PartialUser user,
      Cafe cafe,
      List<int> likeUserIds,
      List<int> reportUserIds,
      List<String> imageUrls});

  $PartialUserCopyWith<$Res> get user;
  $CafeCopyWith<$Res> get cafe;
}

/// @nodoc
class _$CafeLogCopyWithImpl<$Res, $Val extends CafeLog>
    implements $CafeLogCopyWith<$Res> {
  _$CafeLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isVisible = null,
    Object? isPrivate = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? theme = null,
    Object? user = null,
    Object? cafe = null,
    Object? likeUserIds = null,
    Object? reportUserIds = null,
    Object? imageUrls = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as CafeLogTheme,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PartialUser,
      cafe: null == cafe
          ? _value.cafe
          : cafe // ignore: cast_nullable_to_non_nullable
              as Cafe,
      likeUserIds: null == likeUserIds
          ? _value.likeUserIds
          : likeUserIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      reportUserIds: null == reportUserIds
          ? _value.reportUserIds
          : reportUserIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PartialUserCopyWith<$Res> get user {
    return $PartialUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
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
abstract class _$$CafeLogImplCopyWith<$Res> implements $CafeLogCopyWith<$Res> {
  factory _$$CafeLogImplCopyWith(
          _$CafeLogImpl value, $Res Function(_$CafeLogImpl) then) =
      __$$CafeLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      bool isVisible,
      bool isPrivate,
      String content,
      DateTime createdAt,
      DateTime updatedAt,
      CafeLogTheme theme,
      PartialUser user,
      Cafe cafe,
      List<int> likeUserIds,
      List<int> reportUserIds,
      List<String> imageUrls});

  @override
  $PartialUserCopyWith<$Res> get user;
  @override
  $CafeCopyWith<$Res> get cafe;
}

/// @nodoc
class __$$CafeLogImplCopyWithImpl<$Res>
    extends _$CafeLogCopyWithImpl<$Res, _$CafeLogImpl>
    implements _$$CafeLogImplCopyWith<$Res> {
  __$$CafeLogImplCopyWithImpl(
      _$CafeLogImpl _value, $Res Function(_$CafeLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isVisible = null,
    Object? isPrivate = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? theme = null,
    Object? user = null,
    Object? cafe = null,
    Object? likeUserIds = null,
    Object? reportUserIds = null,
    Object? imageUrls = null,
  }) {
    return _then(_$CafeLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as CafeLogTheme,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PartialUser,
      cafe: null == cafe
          ? _value.cafe
          : cafe // ignore: cast_nullable_to_non_nullable
              as Cafe,
      likeUserIds: null == likeUserIds
          ? _value._likeUserIds
          : likeUserIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      reportUserIds: null == reportUserIds
          ? _value._reportUserIds
          : reportUserIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$CafeLogImpl implements _CafeLog {
  _$CafeLogImpl(
      {required this.id,
      required this.isVisible,
      required this.isPrivate,
      required this.content,
      required this.createdAt,
      required this.updatedAt,
      required this.theme,
      required this.user,
      required this.cafe,
      required final List<int> likeUserIds,
      required final List<int> reportUserIds,
      required final List<String> imageUrls})
      : _likeUserIds = likeUserIds,
        _reportUserIds = reportUserIds,
        _imageUrls = imageUrls;

  @override
  final int id;
  @override
  final bool isVisible;
  @override
  final bool isPrivate;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final CafeLogTheme theme;
  @override
  final PartialUser user;
  @override
  final Cafe cafe;
  final List<int> _likeUserIds;
  @override
  List<int> get likeUserIds {
    if (_likeUserIds is EqualUnmodifiableListView) return _likeUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likeUserIds);
  }

  final List<int> _reportUserIds;
  @override
  List<int> get reportUserIds {
    if (_reportUserIds is EqualUnmodifiableListView) return _reportUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reportUserIds);
  }

  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  String toString() {
    return 'CafeLog(id: $id, isVisible: $isVisible, isPrivate: $isPrivate, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, theme: $theme, user: $user, cafe: $cafe, likeUserIds: $likeUserIds, reportUserIds: $reportUserIds, imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cafe, cafe) || other.cafe == cafe) &&
            const DeepCollectionEquality()
                .equals(other._likeUserIds, _likeUserIds) &&
            const DeepCollectionEquality()
                .equals(other._reportUserIds, _reportUserIds) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isVisible,
      isPrivate,
      content,
      createdAt,
      updatedAt,
      theme,
      user,
      cafe,
      const DeepCollectionEquality().hash(_likeUserIds),
      const DeepCollectionEquality().hash(_reportUserIds),
      const DeepCollectionEquality().hash(_imageUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeLogImplCopyWith<_$CafeLogImpl> get copyWith =>
      __$$CafeLogImplCopyWithImpl<_$CafeLogImpl>(this, _$identity);
}

abstract class _CafeLog implements CafeLog {
  factory _CafeLog(
      {required final int id,
      required final bool isVisible,
      required final bool isPrivate,
      required final String content,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final CafeLogTheme theme,
      required final PartialUser user,
      required final Cafe cafe,
      required final List<int> likeUserIds,
      required final List<int> reportUserIds,
      required final List<String> imageUrls}) = _$CafeLogImpl;

  @override
  int get id;
  @override
  bool get isVisible;
  @override
  bool get isPrivate;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  CafeLogTheme get theme;
  @override
  PartialUser get user;
  @override
  Cafe get cafe;
  @override
  List<int> get likeUserIds;
  @override
  List<int> get reportUserIds;
  @override
  List<String> get imageUrls;
  @override
  @JsonKey(ignore: true)
  _$$CafeLogImplCopyWith<_$CafeLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Snapshot {
  int get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  CafeLogTheme get theme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SnapshotCopyWith<Snapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnapshotCopyWith<$Res> {
  factory $SnapshotCopyWith(Snapshot value, $Res Function(Snapshot) then) =
      _$SnapshotCopyWithImpl<$Res, Snapshot>;
  @useResult
  $Res call({int id, String imageUrl, CafeLogTheme theme});
}

/// @nodoc
class _$SnapshotCopyWithImpl<$Res, $Val extends Snapshot>
    implements $SnapshotCopyWith<$Res> {
  _$SnapshotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? theme = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as CafeLogTheme,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SnapshotImplCopyWith<$Res>
    implements $SnapshotCopyWith<$Res> {
  factory _$$SnapshotImplCopyWith(
          _$SnapshotImpl value, $Res Function(_$SnapshotImpl) then) =
      __$$SnapshotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String imageUrl, CafeLogTheme theme});
}

/// @nodoc
class __$$SnapshotImplCopyWithImpl<$Res>
    extends _$SnapshotCopyWithImpl<$Res, _$SnapshotImpl>
    implements _$$SnapshotImplCopyWith<$Res> {
  __$$SnapshotImplCopyWithImpl(
      _$SnapshotImpl _value, $Res Function(_$SnapshotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? theme = null,
  }) {
    return _then(_$SnapshotImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as CafeLogTheme,
    ));
  }
}

/// @nodoc

class _$SnapshotImpl implements _Snapshot {
  _$SnapshotImpl(
      {required this.id, required this.imageUrl, required this.theme});

  @override
  final int id;
  @override
  final String imageUrl;
  @override
  final CafeLogTheme theme;

  @override
  String toString() {
    return 'Snapshot(id: $id, imageUrl: $imageUrl, theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SnapshotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl, theme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SnapshotImplCopyWith<_$SnapshotImpl> get copyWith =>
      __$$SnapshotImplCopyWithImpl<_$SnapshotImpl>(this, _$identity);
}

abstract class _Snapshot implements Snapshot {
  factory _Snapshot(
      {required final int id,
      required final String imageUrl,
      required final CafeLogTheme theme}) = _$SnapshotImpl;

  @override
  int get id;
  @override
  String get imageUrl;
  @override
  CafeLogTheme get theme;
  @override
  @JsonKey(ignore: true)
  _$$SnapshotImplCopyWith<_$SnapshotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
