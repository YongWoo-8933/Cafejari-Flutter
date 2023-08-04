// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapState {
  PanelController get bottomSheetController =>
      throw _privateConstructorUsedError;
  List<Cafe> get cafes => throw _privateConstructorUsedError;
  Cafe get selectedCafe => throw _privateConstructorUsedError;
  CafeFloor get selectedCafeFloor => throw _privateConstructorUsedError;
  NMarker? get selectedMarker => throw _privateConstructorUsedError;
  NaverMapController? get mapController => throw _privateConstructorUsedError;
  double get updatedCrowded => throw _privateConstructorUsedError;
  IconData get thumbIcons => throw _privateConstructorUsedError;
  PageController get pageController => throw _privateConstructorUsedError;
  bool get topVisible => throw _privateConstructorUsedError;
  bool get topImageVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
  @useResult
  $Res call(
      {PanelController bottomSheetController,
      List<Cafe> cafes,
      Cafe selectedCafe,
      CafeFloor selectedCafeFloor,
      NMarker? selectedMarker,
      NaverMapController? mapController,
      double updatedCrowded,
      IconData thumbIcons,
      PageController pageController,
      bool topVisible,
      bool topImageVisible});

  $CafeCopyWith<$Res> get selectedCafe;
  $CafeFloorCopyWith<$Res> get selectedCafeFloor;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bottomSheetController = null,
    Object? cafes = null,
    Object? selectedCafe = null,
    Object? selectedCafeFloor = null,
    Object? selectedMarker = freezed,
    Object? mapController = freezed,
    Object? updatedCrowded = null,
    Object? thumbIcons = null,
    Object? pageController = null,
    Object? topVisible = null,
    Object? topImageVisible = null,
  }) {
    return _then(_value.copyWith(
      bottomSheetController: null == bottomSheetController
          ? _value.bottomSheetController
          : bottomSheetController // ignore: cast_nullable_to_non_nullable
              as PanelController,
      cafes: null == cafes
          ? _value.cafes
          : cafes // ignore: cast_nullable_to_non_nullable
              as List<Cafe>,
      selectedCafe: null == selectedCafe
          ? _value.selectedCafe
          : selectedCafe // ignore: cast_nullable_to_non_nullable
              as Cafe,
      selectedCafeFloor: null == selectedCafeFloor
          ? _value.selectedCafeFloor
          : selectedCafeFloor // ignore: cast_nullable_to_non_nullable
              as CafeFloor,
      selectedMarker: freezed == selectedMarker
          ? _value.selectedMarker
          : selectedMarker // ignore: cast_nullable_to_non_nullable
              as NMarker?,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as NaverMapController?,
      updatedCrowded: null == updatedCrowded
          ? _value.updatedCrowded
          : updatedCrowded // ignore: cast_nullable_to_non_nullable
              as double,
      thumbIcons: null == thumbIcons
          ? _value.thumbIcons
          : thumbIcons // ignore: cast_nullable_to_non_nullable
              as IconData,
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      topVisible: null == topVisible
          ? _value.topVisible
          : topVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      topImageVisible: null == topImageVisible
          ? _value.topImageVisible
          : topImageVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CafeCopyWith<$Res> get selectedCafe {
    return $CafeCopyWith<$Res>(_value.selectedCafe, (value) {
      return _then(_value.copyWith(selectedCafe: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CafeFloorCopyWith<$Res> get selectedCafeFloor {
    return $CafeFloorCopyWith<$Res>(_value.selectedCafeFloor, (value) {
      return _then(_value.copyWith(selectedCafeFloor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$$_MapStateCopyWith(
          _$_MapState value, $Res Function(_$_MapState) then) =
      __$$_MapStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PanelController bottomSheetController,
      List<Cafe> cafes,
      Cafe selectedCafe,
      CafeFloor selectedCafeFloor,
      NMarker? selectedMarker,
      NaverMapController? mapController,
      double updatedCrowded,
      IconData thumbIcons,
      PageController pageController,
      bool topVisible,
      bool topImageVisible});

  @override
  $CafeCopyWith<$Res> get selectedCafe;
  @override
  $CafeFloorCopyWith<$Res> get selectedCafeFloor;
}

/// @nodoc
class __$$_MapStateCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$_MapState>
    implements _$$_MapStateCopyWith<$Res> {
  __$$_MapStateCopyWithImpl(
      _$_MapState _value, $Res Function(_$_MapState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bottomSheetController = null,
    Object? cafes = null,
    Object? selectedCafe = null,
    Object? selectedCafeFloor = null,
    Object? selectedMarker = freezed,
    Object? mapController = freezed,
    Object? updatedCrowded = null,
    Object? thumbIcons = null,
    Object? pageController = null,
    Object? topVisible = null,
    Object? topImageVisible = null,
  }) {
    return _then(_$_MapState(
      bottomSheetController: null == bottomSheetController
          ? _value.bottomSheetController
          : bottomSheetController // ignore: cast_nullable_to_non_nullable
              as PanelController,
      cafes: null == cafes
          ? _value._cafes
          : cafes // ignore: cast_nullable_to_non_nullable
              as List<Cafe>,
      selectedCafe: null == selectedCafe
          ? _value.selectedCafe
          : selectedCafe // ignore: cast_nullable_to_non_nullable
              as Cafe,
      selectedCafeFloor: null == selectedCafeFloor
          ? _value.selectedCafeFloor
          : selectedCafeFloor // ignore: cast_nullable_to_non_nullable
              as CafeFloor,
      selectedMarker: freezed == selectedMarker
          ? _value.selectedMarker
          : selectedMarker // ignore: cast_nullable_to_non_nullable
              as NMarker?,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as NaverMapController?,
      updatedCrowded: null == updatedCrowded
          ? _value.updatedCrowded
          : updatedCrowded // ignore: cast_nullable_to_non_nullable
              as double,
      thumbIcons: null == thumbIcons
          ? _value.thumbIcons
          : thumbIcons // ignore: cast_nullable_to_non_nullable
              as IconData,
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      topVisible: null == topVisible
          ? _value.topVisible
          : topVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      topImageVisible: null == topImageVisible
          ? _value.topImageVisible
          : topImageVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MapState implements _MapState {
  _$_MapState(
      {required this.bottomSheetController,
      required final List<Cafe> cafes,
      required this.selectedCafe,
      required this.selectedCafeFloor,
      required this.selectedMarker,
      required this.mapController,
      required this.updatedCrowded,
      required this.thumbIcons,
      required this.pageController,
      required this.topVisible,
      required this.topImageVisible})
      : _cafes = cafes;

  @override
  final PanelController bottomSheetController;
  final List<Cafe> _cafes;
  @override
  List<Cafe> get cafes {
    if (_cafes is EqualUnmodifiableListView) return _cafes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cafes);
  }

  @override
  final Cafe selectedCafe;
  @override
  final CafeFloor selectedCafeFloor;
  @override
  final NMarker? selectedMarker;
  @override
  final NaverMapController? mapController;
  @override
  final double updatedCrowded;
  @override
  final IconData thumbIcons;
  @override
  final PageController pageController;
  @override
  final bool topVisible;
  @override
  final bool topImageVisible;

  @override
  String toString() {
    return 'MapState(bottomSheetController: $bottomSheetController, cafes: $cafes, selectedCafe: $selectedCafe, selectedCafeFloor: $selectedCafeFloor, selectedMarker: $selectedMarker, mapController: $mapController, updatedCrowded: $updatedCrowded, thumbIcons: $thumbIcons, pageController: $pageController, topVisible: $topVisible, topImageVisible: $topImageVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapState &&
            (identical(other.bottomSheetController, bottomSheetController) ||
                other.bottomSheetController == bottomSheetController) &&
            const DeepCollectionEquality().equals(other._cafes, _cafes) &&
            (identical(other.selectedCafe, selectedCafe) ||
                other.selectedCafe == selectedCafe) &&
            (identical(other.selectedCafeFloor, selectedCafeFloor) ||
                other.selectedCafeFloor == selectedCafeFloor) &&
            (identical(other.selectedMarker, selectedMarker) ||
                other.selectedMarker == selectedMarker) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.updatedCrowded, updatedCrowded) ||
                other.updatedCrowded == updatedCrowded) &&
            (identical(other.thumbIcons, thumbIcons) ||
                other.thumbIcons == thumbIcons) &&
            (identical(other.pageController, pageController) ||
                other.pageController == pageController) &&
            (identical(other.topVisible, topVisible) ||
                other.topVisible == topVisible) &&
            (identical(other.topImageVisible, topImageVisible) ||
                other.topImageVisible == topImageVisible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      bottomSheetController,
      const DeepCollectionEquality().hash(_cafes),
      selectedCafe,
      selectedCafeFloor,
      selectedMarker,
      mapController,
      updatedCrowded,
      thumbIcons,
      pageController,
      topVisible,
      topImageVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapStateCopyWith<_$_MapState> get copyWith =>
      __$$_MapStateCopyWithImpl<_$_MapState>(this, _$identity);
}

abstract class _MapState implements MapState {
  factory _MapState(
      {required final PanelController bottomSheetController,
      required final List<Cafe> cafes,
      required final Cafe selectedCafe,
      required final CafeFloor selectedCafeFloor,
      required final NMarker? selectedMarker,
      required final NaverMapController? mapController,
      required final double updatedCrowded,
      required final IconData thumbIcons,
      required final PageController pageController,
      required final bool topVisible,
      required final bool topImageVisible}) = _$_MapState;

  @override
  PanelController get bottomSheetController;
  @override
  List<Cafe> get cafes;
  @override
  Cafe get selectedCafe;
  @override
  CafeFloor get selectedCafeFloor;
  @override
  NMarker? get selectedMarker;
  @override
  NaverMapController? get mapController;
  @override
  double get updatedCrowded;
  @override
  IconData get thumbIcons;
  @override
  PageController get pageController;
  @override
  bool get topVisible;
  @override
  bool get topImageVisible;
  @override
  @JsonKey(ignore: true)
  _$$_MapStateCopyWith<_$_MapState> get copyWith =>
      throw _privateConstructorUsedError;
}
