// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChallengeState {
  List<Challenge> get availableChallenges => throw _privateConstructorUsedError;
  List<Challenge> get unavailableChallenges =>
      throw _privateConstructorUsedError;
  Challenge get selectedChallenge => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChallengeStateCopyWith<ChallengeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeStateCopyWith<$Res> {
  factory $ChallengeStateCopyWith(
          ChallengeState value, $Res Function(ChallengeState) then) =
      _$ChallengeStateCopyWithImpl<$Res, ChallengeState>;
  @useResult
  $Res call(
      {List<Challenge> availableChallenges,
      List<Challenge> unavailableChallenges,
      Challenge selectedChallenge});

  $ChallengeCopyWith<$Res> get selectedChallenge;
}

/// @nodoc
class _$ChallengeStateCopyWithImpl<$Res, $Val extends ChallengeState>
    implements $ChallengeStateCopyWith<$Res> {
  _$ChallengeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableChallenges = null,
    Object? unavailableChallenges = null,
    Object? selectedChallenge = null,
  }) {
    return _then(_value.copyWith(
      availableChallenges: null == availableChallenges
          ? _value.availableChallenges
          : availableChallenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>,
      unavailableChallenges: null == unavailableChallenges
          ? _value.unavailableChallenges
          : unavailableChallenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>,
      selectedChallenge: null == selectedChallenge
          ? _value.selectedChallenge
          : selectedChallenge // ignore: cast_nullable_to_non_nullable
              as Challenge,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChallengeCopyWith<$Res> get selectedChallenge {
    return $ChallengeCopyWith<$Res>(_value.selectedChallenge, (value) {
      return _then(_value.copyWith(selectedChallenge: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChallengeStateCopyWith<$Res>
    implements $ChallengeStateCopyWith<$Res> {
  factory _$$_ChallengeStateCopyWith(
          _$_ChallengeState value, $Res Function(_$_ChallengeState) then) =
      __$$_ChallengeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Challenge> availableChallenges,
      List<Challenge> unavailableChallenges,
      Challenge selectedChallenge});

  @override
  $ChallengeCopyWith<$Res> get selectedChallenge;
}

/// @nodoc
class __$$_ChallengeStateCopyWithImpl<$Res>
    extends _$ChallengeStateCopyWithImpl<$Res, _$_ChallengeState>
    implements _$$_ChallengeStateCopyWith<$Res> {
  __$$_ChallengeStateCopyWithImpl(
      _$_ChallengeState _value, $Res Function(_$_ChallengeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableChallenges = null,
    Object? unavailableChallenges = null,
    Object? selectedChallenge = null,
  }) {
    return _then(_$_ChallengeState(
      availableChallenges: null == availableChallenges
          ? _value._availableChallenges
          : availableChallenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>,
      unavailableChallenges: null == unavailableChallenges
          ? _value._unavailableChallenges
          : unavailableChallenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>,
      selectedChallenge: null == selectedChallenge
          ? _value.selectedChallenge
          : selectedChallenge // ignore: cast_nullable_to_non_nullable
              as Challenge,
    ));
  }
}

/// @nodoc

class _$_ChallengeState implements _ChallengeState {
  _$_ChallengeState(
      {required final List<Challenge> availableChallenges,
      required final List<Challenge> unavailableChallenges,
      required this.selectedChallenge})
      : _availableChallenges = availableChallenges,
        _unavailableChallenges = unavailableChallenges;

  final List<Challenge> _availableChallenges;
  @override
  List<Challenge> get availableChallenges {
    if (_availableChallenges is EqualUnmodifiableListView)
      return _availableChallenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableChallenges);
  }

  final List<Challenge> _unavailableChallenges;
  @override
  List<Challenge> get unavailableChallenges {
    if (_unavailableChallenges is EqualUnmodifiableListView)
      return _unavailableChallenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unavailableChallenges);
  }

  @override
  final Challenge selectedChallenge;

  @override
  String toString() {
    return 'ChallengeState(availableChallenges: $availableChallenges, unavailableChallenges: $unavailableChallenges, selectedChallenge: $selectedChallenge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChallengeState &&
            const DeepCollectionEquality()
                .equals(other._availableChallenges, _availableChallenges) &&
            const DeepCollectionEquality()
                .equals(other._unavailableChallenges, _unavailableChallenges) &&
            (identical(other.selectedChallenge, selectedChallenge) ||
                other.selectedChallenge == selectedChallenge));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_availableChallenges),
      const DeepCollectionEquality().hash(_unavailableChallenges),
      selectedChallenge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChallengeStateCopyWith<_$_ChallengeState> get copyWith =>
      __$$_ChallengeStateCopyWithImpl<_$_ChallengeState>(this, _$identity);
}

abstract class _ChallengeState implements ChallengeState {
  factory _ChallengeState(
      {required final List<Challenge> availableChallenges,
      required final List<Challenge> unavailableChallenges,
      required final Challenge selectedChallenge}) = _$_ChallengeState;

  @override
  List<Challenge> get availableChallenges;
  @override
  List<Challenge> get unavailableChallenges;
  @override
  Challenge get selectedChallenge;
  @override
  @JsonKey(ignore: true)
  _$$_ChallengeStateCopyWith<_$_ChallengeState> get copyWith =>
      throw _privateConstructorUsedError;
}
