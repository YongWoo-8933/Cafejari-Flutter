// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestState {
  String get cafeName => throw _privateConstructorUsedError;
  String get cafeAddress => throw _privateConstructorUsedError;
  NaverMapController? get mapController => throw _privateConstructorUsedError;
  TextEditingController get searchQueryController =>
      throw _privateConstructorUsedError;
  TextEditingController get freeQueryController =>
      throw _privateConstructorUsedError;
  int get selectedMaxFloor => throw _privateConstructorUsedError;
  int get selectedMinFloor => throw _privateConstructorUsedError;
  List<({int floor, double rate})> get wallSocketRates =>
      throw _privateConstructorUsedError;
  bool get isWallSocketEdited => throw _privateConstructorUsedError;
  List<DayOfWeekOpeningInfo> get openingInfos =>
      throw _privateConstructorUsedError;
  bool get isOpeningHourEdited => throw _privateConstructorUsedError;
  List<String> get selectedDaysOfWeek => throw _privateConstructorUsedError;
  DayOfWeekOpeningInfo get selectedOpeningInfo =>
      throw _privateConstructorUsedError;
  OpeningHour get openingHour => throw _privateConstructorUsedError;
  OpeningHour get clickedDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestStateCopyWith<RequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStateCopyWith<$Res> {
  factory $RequestStateCopyWith(
          RequestState value, $Res Function(RequestState) then) =
      _$RequestStateCopyWithImpl<$Res, RequestState>;
  @useResult
  $Res call(
      {String cafeName,
      String cafeAddress,
      NaverMapController? mapController,
      TextEditingController searchQueryController,
      TextEditingController freeQueryController,
      int selectedMaxFloor,
      int selectedMinFloor,
      List<({int floor, double rate})> wallSocketRates,
      bool isWallSocketEdited,
      List<DayOfWeekOpeningInfo> openingInfos,
      bool isOpeningHourEdited,
      List<String> selectedDaysOfWeek,
      DayOfWeekOpeningInfo selectedOpeningInfo,
      OpeningHour openingHour,
      OpeningHour clickedDay});

  $OpeningHourCopyWith<$Res> get openingHour;
  $OpeningHourCopyWith<$Res> get clickedDay;
}

/// @nodoc
class _$RequestStateCopyWithImpl<$Res, $Val extends RequestState>
    implements $RequestStateCopyWith<$Res> {
  _$RequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cafeName = null,
    Object? cafeAddress = null,
    Object? mapController = freezed,
    Object? searchQueryController = null,
    Object? freeQueryController = null,
    Object? selectedMaxFloor = null,
    Object? selectedMinFloor = null,
    Object? wallSocketRates = null,
    Object? isWallSocketEdited = null,
    Object? openingInfos = null,
    Object? isOpeningHourEdited = null,
    Object? selectedDaysOfWeek = null,
    Object? selectedOpeningInfo = null,
    Object? openingHour = null,
    Object? clickedDay = null,
  }) {
    return _then(_value.copyWith(
      cafeName: null == cafeName
          ? _value.cafeName
          : cafeName // ignore: cast_nullable_to_non_nullable
              as String,
      cafeAddress: null == cafeAddress
          ? _value.cafeAddress
          : cafeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as NaverMapController?,
      searchQueryController: null == searchQueryController
          ? _value.searchQueryController
          : searchQueryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      freeQueryController: null == freeQueryController
          ? _value.freeQueryController
          : freeQueryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      selectedMaxFloor: null == selectedMaxFloor
          ? _value.selectedMaxFloor
          : selectedMaxFloor // ignore: cast_nullable_to_non_nullable
              as int,
      selectedMinFloor: null == selectedMinFloor
          ? _value.selectedMinFloor
          : selectedMinFloor // ignore: cast_nullable_to_non_nullable
              as int,
      wallSocketRates: null == wallSocketRates
          ? _value.wallSocketRates
          : wallSocketRates // ignore: cast_nullable_to_non_nullable
              as List<({int floor, double rate})>,
      isWallSocketEdited: null == isWallSocketEdited
          ? _value.isWallSocketEdited
          : isWallSocketEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      openingInfos: null == openingInfos
          ? _value.openingInfos
          : openingInfos // ignore: cast_nullable_to_non_nullable
              as List<DayOfWeekOpeningInfo>,
      isOpeningHourEdited: null == isOpeningHourEdited
          ? _value.isOpeningHourEdited
          : isOpeningHourEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDaysOfWeek: null == selectedDaysOfWeek
          ? _value.selectedDaysOfWeek
          : selectedDaysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedOpeningInfo: null == selectedOpeningInfo
          ? _value.selectedOpeningInfo
          : selectedOpeningInfo // ignore: cast_nullable_to_non_nullable
              as DayOfWeekOpeningInfo,
      openingHour: null == openingHour
          ? _value.openingHour
          : openingHour // ignore: cast_nullable_to_non_nullable
              as OpeningHour,
      clickedDay: null == clickedDay
          ? _value.clickedDay
          : clickedDay // ignore: cast_nullable_to_non_nullable
              as OpeningHour,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OpeningHourCopyWith<$Res> get openingHour {
    return $OpeningHourCopyWith<$Res>(_value.openingHour, (value) {
      return _then(_value.copyWith(openingHour: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OpeningHourCopyWith<$Res> get clickedDay {
    return $OpeningHourCopyWith<$Res>(_value.clickedDay, (value) {
      return _then(_value.copyWith(clickedDay: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RequestStateCopyWith<$Res>
    implements $RequestStateCopyWith<$Res> {
  factory _$$_RequestStateCopyWith(
          _$_RequestState value, $Res Function(_$_RequestState) then) =
      __$$_RequestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cafeName,
      String cafeAddress,
      NaverMapController? mapController,
      TextEditingController searchQueryController,
      TextEditingController freeQueryController,
      int selectedMaxFloor,
      int selectedMinFloor,
      List<({int floor, double rate})> wallSocketRates,
      bool isWallSocketEdited,
      List<DayOfWeekOpeningInfo> openingInfos,
      bool isOpeningHourEdited,
      List<String> selectedDaysOfWeek,
      DayOfWeekOpeningInfo selectedOpeningInfo,
      OpeningHour openingHour,
      OpeningHour clickedDay});

  @override
  $OpeningHourCopyWith<$Res> get openingHour;
  @override
  $OpeningHourCopyWith<$Res> get clickedDay;
}

/// @nodoc
class __$$_RequestStateCopyWithImpl<$Res>
    extends _$RequestStateCopyWithImpl<$Res, _$_RequestState>
    implements _$$_RequestStateCopyWith<$Res> {
  __$$_RequestStateCopyWithImpl(
      _$_RequestState _value, $Res Function(_$_RequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cafeName = null,
    Object? cafeAddress = null,
    Object? mapController = freezed,
    Object? searchQueryController = null,
    Object? freeQueryController = null,
    Object? selectedMaxFloor = null,
    Object? selectedMinFloor = null,
    Object? wallSocketRates = null,
    Object? isWallSocketEdited = null,
    Object? openingInfos = null,
    Object? isOpeningHourEdited = null,
    Object? selectedDaysOfWeek = null,
    Object? selectedOpeningInfo = null,
    Object? openingHour = null,
    Object? clickedDay = null,
  }) {
    return _then(_$_RequestState(
      cafeName: null == cafeName
          ? _value.cafeName
          : cafeName // ignore: cast_nullable_to_non_nullable
              as String,
      cafeAddress: null == cafeAddress
          ? _value.cafeAddress
          : cafeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as NaverMapController?,
      searchQueryController: null == searchQueryController
          ? _value.searchQueryController
          : searchQueryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      freeQueryController: null == freeQueryController
          ? _value.freeQueryController
          : freeQueryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      selectedMaxFloor: null == selectedMaxFloor
          ? _value.selectedMaxFloor
          : selectedMaxFloor // ignore: cast_nullable_to_non_nullable
              as int,
      selectedMinFloor: null == selectedMinFloor
          ? _value.selectedMinFloor
          : selectedMinFloor // ignore: cast_nullable_to_non_nullable
              as int,
      wallSocketRates: null == wallSocketRates
          ? _value._wallSocketRates
          : wallSocketRates // ignore: cast_nullable_to_non_nullable
              as List<({int floor, double rate})>,
      isWallSocketEdited: null == isWallSocketEdited
          ? _value.isWallSocketEdited
          : isWallSocketEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      openingInfos: null == openingInfos
          ? _value._openingInfos
          : openingInfos // ignore: cast_nullable_to_non_nullable
              as List<DayOfWeekOpeningInfo>,
      isOpeningHourEdited: null == isOpeningHourEdited
          ? _value.isOpeningHourEdited
          : isOpeningHourEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDaysOfWeek: null == selectedDaysOfWeek
          ? _value._selectedDaysOfWeek
          : selectedDaysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedOpeningInfo: null == selectedOpeningInfo
          ? _value.selectedOpeningInfo
          : selectedOpeningInfo // ignore: cast_nullable_to_non_nullable
              as DayOfWeekOpeningInfo,
      openingHour: null == openingHour
          ? _value.openingHour
          : openingHour // ignore: cast_nullable_to_non_nullable
              as OpeningHour,
      clickedDay: null == clickedDay
          ? _value.clickedDay
          : clickedDay // ignore: cast_nullable_to_non_nullable
              as OpeningHour,
    ));
  }
}

/// @nodoc

class _$_RequestState implements _RequestState {
  _$_RequestState(
      {required this.cafeName,
      required this.cafeAddress,
      required this.mapController,
      required this.searchQueryController,
      required this.freeQueryController,
      required this.selectedMaxFloor,
      required this.selectedMinFloor,
      required final List<({int floor, double rate})> wallSocketRates,
      required this.isWallSocketEdited,
      required final List<DayOfWeekOpeningInfo> openingInfos,
      required this.isOpeningHourEdited,
      required final List<String> selectedDaysOfWeek,
      required this.selectedOpeningInfo,
      required this.openingHour,
      required this.clickedDay})
      : _wallSocketRates = wallSocketRates,
        _openingInfos = openingInfos,
        _selectedDaysOfWeek = selectedDaysOfWeek;

  @override
  final String cafeName;
  @override
  final String cafeAddress;
  @override
  final NaverMapController? mapController;
  @override
  final TextEditingController searchQueryController;
  @override
  final TextEditingController freeQueryController;
  @override
  final int selectedMaxFloor;
  @override
  final int selectedMinFloor;
  final List<({int floor, double rate})> _wallSocketRates;
  @override
  List<({int floor, double rate})> get wallSocketRates {
    if (_wallSocketRates is EqualUnmodifiableListView) return _wallSocketRates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallSocketRates);
  }

  @override
  final bool isWallSocketEdited;
  final List<DayOfWeekOpeningInfo> _openingInfos;
  @override
  List<DayOfWeekOpeningInfo> get openingInfos {
    if (_openingInfos is EqualUnmodifiableListView) return _openingInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openingInfos);
  }

  @override
  final bool isOpeningHourEdited;
  final List<String> _selectedDaysOfWeek;
  @override
  List<String> get selectedDaysOfWeek {
    if (_selectedDaysOfWeek is EqualUnmodifiableListView)
      return _selectedDaysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedDaysOfWeek);
  }

  @override
  final DayOfWeekOpeningInfo selectedOpeningInfo;
  @override
  final OpeningHour openingHour;
  @override
  final OpeningHour clickedDay;

  @override
  String toString() {
    return 'RequestState(cafeName: $cafeName, cafeAddress: $cafeAddress, mapController: $mapController, searchQueryController: $searchQueryController, freeQueryController: $freeQueryController, selectedMaxFloor: $selectedMaxFloor, selectedMinFloor: $selectedMinFloor, wallSocketRates: $wallSocketRates, isWallSocketEdited: $isWallSocketEdited, openingInfos: $openingInfos, isOpeningHourEdited: $isOpeningHourEdited, selectedDaysOfWeek: $selectedDaysOfWeek, selectedOpeningInfo: $selectedOpeningInfo, openingHour: $openingHour, clickedDay: $clickedDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestState &&
            (identical(other.cafeName, cafeName) ||
                other.cafeName == cafeName) &&
            (identical(other.cafeAddress, cafeAddress) ||
                other.cafeAddress == cafeAddress) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.searchQueryController, searchQueryController) ||
                other.searchQueryController == searchQueryController) &&
            (identical(other.freeQueryController, freeQueryController) ||
                other.freeQueryController == freeQueryController) &&
            (identical(other.selectedMaxFloor, selectedMaxFloor) ||
                other.selectedMaxFloor == selectedMaxFloor) &&
            (identical(other.selectedMinFloor, selectedMinFloor) ||
                other.selectedMinFloor == selectedMinFloor) &&
            const DeepCollectionEquality()
                .equals(other._wallSocketRates, _wallSocketRates) &&
            (identical(other.isWallSocketEdited, isWallSocketEdited) ||
                other.isWallSocketEdited == isWallSocketEdited) &&
            const DeepCollectionEquality()
                .equals(other._openingInfos, _openingInfos) &&
            (identical(other.isOpeningHourEdited, isOpeningHourEdited) ||
                other.isOpeningHourEdited == isOpeningHourEdited) &&
            const DeepCollectionEquality()
                .equals(other._selectedDaysOfWeek, _selectedDaysOfWeek) &&
            (identical(other.selectedOpeningInfo, selectedOpeningInfo) ||
                other.selectedOpeningInfo == selectedOpeningInfo) &&
            (identical(other.openingHour, openingHour) ||
                other.openingHour == openingHour) &&
            (identical(other.clickedDay, clickedDay) ||
                other.clickedDay == clickedDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      cafeName,
      cafeAddress,
      mapController,
      searchQueryController,
      freeQueryController,
      selectedMaxFloor,
      selectedMinFloor,
      const DeepCollectionEquality().hash(_wallSocketRates),
      isWallSocketEdited,
      const DeepCollectionEquality().hash(_openingInfos),
      isOpeningHourEdited,
      const DeepCollectionEquality().hash(_selectedDaysOfWeek),
      selectedOpeningInfo,
      openingHour,
      clickedDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestStateCopyWith<_$_RequestState> get copyWith =>
      __$$_RequestStateCopyWithImpl<_$_RequestState>(this, _$identity);
}

abstract class _RequestState implements RequestState {
  factory _RequestState(
      {required final String cafeName,
      required final String cafeAddress,
      required final NaverMapController? mapController,
      required final TextEditingController searchQueryController,
      required final TextEditingController freeQueryController,
      required final int selectedMaxFloor,
      required final int selectedMinFloor,
      required final List<({int floor, double rate})> wallSocketRates,
      required final bool isWallSocketEdited,
      required final List<DayOfWeekOpeningInfo> openingInfos,
      required final bool isOpeningHourEdited,
      required final List<String> selectedDaysOfWeek,
      required final DayOfWeekOpeningInfo selectedOpeningInfo,
      required final OpeningHour openingHour,
      required final OpeningHour clickedDay}) = _$_RequestState;

  @override
  String get cafeName;
  @override
  String get cafeAddress;
  @override
  NaverMapController? get mapController;
  @override
  TextEditingController get searchQueryController;
  @override
  TextEditingController get freeQueryController;
  @override
  int get selectedMaxFloor;
  @override
  int get selectedMinFloor;
  @override
  List<({int floor, double rate})> get wallSocketRates;
  @override
  bool get isWallSocketEdited;
  @override
  List<DayOfWeekOpeningInfo> get openingInfos;
  @override
  bool get isOpeningHourEdited;
  @override
  List<String> get selectedDaysOfWeek;
  @override
  DayOfWeekOpeningInfo get selectedOpeningInfo;
  @override
  OpeningHour get openingHour;
  @override
  OpeningHour get clickedDay;
  @override
  @JsonKey(ignore: true)
  _$$_RequestStateCopyWith<_$_RequestState> get copyWith =>
      throw _privateConstructorUsedError;
}
