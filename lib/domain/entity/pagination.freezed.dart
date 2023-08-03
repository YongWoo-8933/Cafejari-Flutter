// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Pagination<T> {
  int get count => throw _privateConstructorUsedError;
  String? get nextPageUrl => throw _privateConstructorUsedError;
  String? get previousPageUrl => throw _privateConstructorUsedError;
  List<T> get results => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationCopyWith<T, Pagination<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<T, $Res> {
  factory $PaginationCopyWith(
          Pagination<T> value, $Res Function(Pagination<T>) then) =
      _$PaginationCopyWithImpl<T, $Res, Pagination<T>>;
  @useResult
  $Res call(
      {int count,
      String? nextPageUrl,
      String? previousPageUrl,
      List<T> results});
}

/// @nodoc
class _$PaginationCopyWithImpl<T, $Res, $Val extends Pagination<T>>
    implements $PaginationCopyWith<T, $Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? nextPageUrl = freezed,
    Object? previousPageUrl = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      previousPageUrl: freezed == previousPageUrl
          ? _value.previousPageUrl
          : previousPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationCopyWith<T, $Res>
    implements $PaginationCopyWith<T, $Res> {
  factory _$$_PaginationCopyWith(
          _$_Pagination<T> value, $Res Function(_$_Pagination<T>) then) =
      __$$_PaginationCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? nextPageUrl,
      String? previousPageUrl,
      List<T> results});
}

/// @nodoc
class __$$_PaginationCopyWithImpl<T, $Res>
    extends _$PaginationCopyWithImpl<T, $Res, _$_Pagination<T>>
    implements _$$_PaginationCopyWith<T, $Res> {
  __$$_PaginationCopyWithImpl(
      _$_Pagination<T> _value, $Res Function(_$_Pagination<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? nextPageUrl = freezed,
    Object? previousPageUrl = freezed,
    Object? results = null,
  }) {
    return _then(_$_Pagination<T>(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      previousPageUrl: freezed == previousPageUrl
          ? _value.previousPageUrl
          : previousPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$_Pagination<T> implements _Pagination<T> {
  _$_Pagination(
      {required this.count,
      required this.nextPageUrl,
      required this.previousPageUrl,
      required final List<T> results})
      : _results = results;

  @override
  final int count;
  @override
  final String? nextPageUrl;
  @override
  final String? previousPageUrl;
  final List<T> _results;
  @override
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'Pagination<$T>(count: $count, nextPageUrl: $nextPageUrl, previousPageUrl: $previousPageUrl, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pagination<T> &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                other.nextPageUrl == nextPageUrl) &&
            (identical(other.previousPageUrl, previousPageUrl) ||
                other.previousPageUrl == previousPageUrl) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count, nextPageUrl,
      previousPageUrl, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationCopyWith<T, _$_Pagination<T>> get copyWith =>
      __$$_PaginationCopyWithImpl<T, _$_Pagination<T>>(this, _$identity);
}

abstract class _Pagination<T> implements Pagination<T> {
  factory _Pagination(
      {required final int count,
      required final String? nextPageUrl,
      required final String? previousPageUrl,
      required final List<T> results}) = _$_Pagination<T>;

  @override
  int get count;
  @override
  String? get nextPageUrl;
  @override
  String? get previousPageUrl;
  @override
  List<T> get results;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationCopyWith<T, _$_Pagination<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
