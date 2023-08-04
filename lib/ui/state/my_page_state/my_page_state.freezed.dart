// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyPageState {
  int get counter => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyPageStateCopyWith<MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageStateCopyWith<$Res> {
  factory $MyPageStateCopyWith(
          MyPageState value, $Res Function(MyPageState) then) =
      _$MyPageStateCopyWithImpl<$Res, MyPageState>;
  @useResult
  $Res call({int counter, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$MyPageStateCopyWithImpl<$Res, $Val extends MyPageState>
    implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MyPageStateCopyWith<$Res>
    implements $MyPageStateCopyWith<$Res> {
  factory _$$_MyPageStateCopyWith(
          _$_MyPageState value, $Res Function(_$_MyPageState) then) =
      __$$_MyPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_MyPageStateCopyWithImpl<$Res>
    extends _$MyPageStateCopyWithImpl<$Res, _$_MyPageState>
    implements _$$_MyPageStateCopyWith<$Res> {
  __$$_MyPageStateCopyWithImpl(
      _$_MyPageState _value, $Res Function(_$_MyPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? user = null,
  }) {
    return _then(_$_MyPageState(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_MyPageState implements _MyPageState {
  _$_MyPageState({required this.counter, required this.user});

  @override
  final int counter;
  @override
  final User user;

  @override
  String toString() {
    return 'MyPageState(counter: $counter, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyPageState &&
            (identical(other.counter, counter) || other.counter == counter) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counter, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyPageStateCopyWith<_$_MyPageState> get copyWith =>
      __$$_MyPageStateCopyWithImpl<_$_MyPageState>(this, _$identity);
}

abstract class _MyPageState implements MyPageState {
  factory _MyPageState({required final int counter, required final User user}) =
      _$_MyPageState;

  @override
  int get counter;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_MyPageStateCopyWith<_$_MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
