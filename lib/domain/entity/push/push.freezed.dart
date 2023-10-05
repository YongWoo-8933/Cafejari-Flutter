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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_PushCopyWith<$Res> implements $PushCopyWith<$Res> {
  factory _$$_PushCopyWith(_$_Push value, $Res Function(_$_Push) then) =
      __$$_PushCopyWithImpl<$Res>;
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
class __$$_PushCopyWithImpl<$Res> extends _$PushCopyWithImpl<$Res, _$_Push>
    implements _$$_PushCopyWith<$Res> {
  __$$_PushCopyWithImpl(_$_Push _value, $Res Function(_$_Push) _then)
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
    return _then(_$_Push(
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

class _$_Push implements _Push {
  _$_Push(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Push &&
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
  _$$_PushCopyWith<_$_Push> get copyWith =>
      __$$_PushCopyWithImpl<_$_Push>(this, _$identity);
}

abstract class _Push implements Push {
  factory _Push(
      {required final int id,
      required final String title,
      required final String body,
      required final DateTime pushedAt,
      required final bool isRead,
      required final PushType type}) = _$_Push;

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
  _$$_PushCopyWith<_$_Push> get copyWith => throw _privateConstructorUsedError;
}
