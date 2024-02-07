// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Push {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get pushedAt => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  PushType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PushCopyWith<Push> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushCopyWith<$Res> {
  factory $PushCopyWith(Push value, $Res Function(Push) then) =
      _$PushCopyWithImpl<$Res, Push>;
  @useResult
  $Res call(
      {int id,
      String title,
      String body,
      DateTime pushedAt,
      bool isRead,
      PushType type});
}

/// @nodoc
class _$PushCopyWithImpl<$Res, $Val extends Push>
    implements $PushCopyWith<$Res> {
  _$PushCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? pushedAt = null,
    Object? isRead = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      pushedAt: null == pushedAt
          ? _value.pushedAt
          : pushedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PushType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushImplCopyWith<$Res> implements $PushCopyWith<$Res> {
  factory _$$PushImplCopyWith(
          _$PushImpl value, $Res Function(_$PushImpl) then) =
      __$$PushImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String body,
      DateTime pushedAt,
      bool isRead,
      PushType type});
}

/// @nodoc
class __$$PushImplCopyWithImpl<$Res>
    extends _$PushCopyWithImpl<$Res, _$PushImpl>
    implements _$$PushImplCopyWith<$Res> {
  __$$PushImplCopyWithImpl(_$PushImpl _value, $Res Function(_$PushImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? pushedAt = null,
    Object? isRead = null,
    Object? type = null,
  }) {
    return _then(_$PushImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      pushedAt: null == pushedAt
          ? _value.pushedAt
          : pushedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PushType,
    ));
  }
}

/// @nodoc

class _$PushImpl implements _Push {
  _$PushImpl(
      {required this.id,
      required this.title,
      required this.body,
      required this.pushedAt,
      required this.isRead,
      required this.type});

  @override
  final int id;
  @override
  final String title;
  @override
  final String body;
  @override
  final DateTime pushedAt;
  @override
  final bool isRead;
  @override
  final PushType type;

  @override
  String toString() {
    return 'Push(id: $id, title: $title, body: $body, pushedAt: $pushedAt, isRead: $isRead, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.pushedAt, pushedAt) ||
                other.pushedAt == pushedAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, body, pushedAt, isRead, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushImplCopyWith<_$PushImpl> get copyWith =>
      __$$PushImplCopyWithImpl<_$PushImpl>(this, _$identity);
}

abstract class _Push implements Push {
  factory _Push(
      {required final int id,
      required final String title,
      required final String body,
      required final DateTime pushedAt,
      required final bool isRead,
      required final PushType type}) = _$PushImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get body;
  @override
  DateTime get pushedAt;
  @override
  bool get isRead;
  @override
  PushType get type;
  @override
  @JsonKey(ignore: true)
  _$$PushImplCopyWith<_$PushImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PopUp {
  int get id => throw _privateConstructorUsedError;
  int? get inAppRouteTargetIndex => throw _privateConstructorUsedError;
  int? get cafeId => throw _privateConstructorUsedError;
  int? get challengeId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get webViewUrl => throw _privateConstructorUsedError;
  String? get externalUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PopUpCopyWith<PopUp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopUpCopyWith<$Res> {
  factory $PopUpCopyWith(PopUp value, $Res Function(PopUp) then) =
      _$PopUpCopyWithImpl<$Res, PopUp>;
  @useResult
  $Res call(
      {int id,
      int? inAppRouteTargetIndex,
      int? cafeId,
      int? challengeId,
      String title,
      String imageUrl,
      String? webViewUrl,
      String? externalUrl});
}

/// @nodoc
class _$PopUpCopyWithImpl<$Res, $Val extends PopUp>
    implements $PopUpCopyWith<$Res> {
  _$PopUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? inAppRouteTargetIndex = freezed,
    Object? cafeId = freezed,
    Object? challengeId = freezed,
    Object? title = null,
    Object? imageUrl = null,
    Object? webViewUrl = freezed,
    Object? externalUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      inAppRouteTargetIndex: freezed == inAppRouteTargetIndex
          ? _value.inAppRouteTargetIndex
          : inAppRouteTargetIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      cafeId: freezed == cafeId
          ? _value.cafeId
          : cafeId // ignore: cast_nullable_to_non_nullable
              as int?,
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      webViewUrl: freezed == webViewUrl
          ? _value.webViewUrl
          : webViewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      externalUrl: freezed == externalUrl
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopUpImplCopyWith<$Res> implements $PopUpCopyWith<$Res> {
  factory _$$PopUpImplCopyWith(
          _$PopUpImpl value, $Res Function(_$PopUpImpl) then) =
      __$$PopUpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? inAppRouteTargetIndex,
      int? cafeId,
      int? challengeId,
      String title,
      String imageUrl,
      String? webViewUrl,
      String? externalUrl});
}

/// @nodoc
class __$$PopUpImplCopyWithImpl<$Res>
    extends _$PopUpCopyWithImpl<$Res, _$PopUpImpl>
    implements _$$PopUpImplCopyWith<$Res> {
  __$$PopUpImplCopyWithImpl(
      _$PopUpImpl _value, $Res Function(_$PopUpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? inAppRouteTargetIndex = freezed,
    Object? cafeId = freezed,
    Object? challengeId = freezed,
    Object? title = null,
    Object? imageUrl = null,
    Object? webViewUrl = freezed,
    Object? externalUrl = freezed,
  }) {
    return _then(_$PopUpImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      inAppRouteTargetIndex: freezed == inAppRouteTargetIndex
          ? _value.inAppRouteTargetIndex
          : inAppRouteTargetIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      cafeId: freezed == cafeId
          ? _value.cafeId
          : cafeId // ignore: cast_nullable_to_non_nullable
              as int?,
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      webViewUrl: freezed == webViewUrl
          ? _value.webViewUrl
          : webViewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      externalUrl: freezed == externalUrl
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PopUpImpl implements _PopUp {
  _$PopUpImpl(
      {required this.id,
      required this.inAppRouteTargetIndex,
      required this.cafeId,
      required this.challengeId,
      required this.title,
      required this.imageUrl,
      required this.webViewUrl,
      required this.externalUrl});

  @override
  final int id;
  @override
  final int? inAppRouteTargetIndex;
  @override
  final int? cafeId;
  @override
  final int? challengeId;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final String? webViewUrl;
  @override
  final String? externalUrl;

  @override
  String toString() {
    return 'PopUp(id: $id, inAppRouteTargetIndex: $inAppRouteTargetIndex, cafeId: $cafeId, challengeId: $challengeId, title: $title, imageUrl: $imageUrl, webViewUrl: $webViewUrl, externalUrl: $externalUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopUpImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inAppRouteTargetIndex, inAppRouteTargetIndex) ||
                other.inAppRouteTargetIndex == inAppRouteTargetIndex) &&
            (identical(other.cafeId, cafeId) || other.cafeId == cafeId) &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.webViewUrl, webViewUrl) ||
                other.webViewUrl == webViewUrl) &&
            (identical(other.externalUrl, externalUrl) ||
                other.externalUrl == externalUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, inAppRouteTargetIndex,
      cafeId, challengeId, title, imageUrl, webViewUrl, externalUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PopUpImplCopyWith<_$PopUpImpl> get copyWith =>
      __$$PopUpImplCopyWithImpl<_$PopUpImpl>(this, _$identity);
}

abstract class _PopUp implements PopUp {
  factory _PopUp(
      {required final int id,
      required final int? inAppRouteTargetIndex,
      required final int? cafeId,
      required final int? challengeId,
      required final String title,
      required final String imageUrl,
      required final String? webViewUrl,
      required final String? externalUrl}) = _$PopUpImpl;

  @override
  int get id;
  @override
  int? get inAppRouteTargetIndex;
  @override
  int? get cafeId;
  @override
  int? get challengeId;
  @override
  String get title;
  @override
  String get imageUrl;
  @override
  String? get webViewUrl;
  @override
  String? get externalUrl;
  @override
  @JsonKey(ignore: true)
  _$$PopUpImplCopyWith<_$PopUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
