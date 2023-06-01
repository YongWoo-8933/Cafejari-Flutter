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
  List<CafeInfo> get cafeInfos => throw _privateConstructorUsedError;
  NMarker? get selectedMarker => throw _privateConstructorUsedError;
  CafeInfo get selectedCafeInfo => throw _privateConstructorUsedError;
  NaverMapController? get mapController => throw _privateConstructorUsedError;

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
      List<CafeInfo> cafeInfos,
      NMarker? selectedMarker,
      CafeInfo selectedCafeInfo,
      NaverMapController? mapController});

  $CafeInfoCopyWith<$Res> get selectedCafeInfo;
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
    Object? cafeInfos = null,
    Object? selectedMarker = freezed,
    Object? selectedCafeInfo = null,
    Object? mapController = freezed,
  }) {
    return _then(_value.copyWith(
      bottomSheetController: null == bottomSheetController
          ? _value.bottomSheetController
          : bottomSheetController // ignore: cast_nullable_to_non_nullable
              as PanelController,
      cafeInfos: null == cafeInfos
          ? _value.cafeInfos
          : cafeInfos // ignore: cast_nullable_to_non_nullable
              as List<CafeInfo>,
      selectedMarker: freezed == selectedMarker
          ? _value.selectedMarker
          : selectedMarker // ignore: cast_nullable_to_non_nullable
              as NMarker?,
      selectedCafeInfo: null == selectedCafeInfo
          ? _value.selectedCafeInfo
          : selectedCafeInfo // ignore: cast_nullable_to_non_nullable
              as CafeInfo,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as NaverMapController?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CafeInfoCopyWith<$Res> get selectedCafeInfo {
    return $CafeInfoCopyWith<$Res>(_value.selectedCafeInfo, (value) {
      return _then(_value.copyWith(selectedCafeInfo: value) as $Val);
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
      List<CafeInfo> cafeInfos,
      NMarker? selectedMarker,
      CafeInfo selectedCafeInfo,
      NaverMapController? mapController});

  @override
  $CafeInfoCopyWith<$Res> get selectedCafeInfo;
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
    Object? cafeInfos = null,
    Object? selectedMarker = freezed,
    Object? selectedCafeInfo = null,
    Object? mapController = freezed,
  }) {
    return _then(_$_MapState(
      bottomSheetController: null == bottomSheetController
          ? _value.bottomSheetController
          : bottomSheetController // ignore: cast_nullable_to_non_nullable
              as PanelController,
      cafeInfos: null == cafeInfos
          ? _value._cafeInfos
          : cafeInfos // ignore: cast_nullable_to_non_nullable
              as List<CafeInfo>,
      selectedMarker: freezed == selectedMarker
          ? _value.selectedMarker
          : selectedMarker // ignore: cast_nullable_to_non_nullable
              as NMarker?,
      selectedCafeInfo: null == selectedCafeInfo
          ? _value.selectedCafeInfo
          : selectedCafeInfo // ignore: cast_nullable_to_non_nullable
              as CafeInfo,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as NaverMapController?,
    ));
  }
}

/// @nodoc

class _$_MapState implements _MapState {
  _$_MapState(
      {required this.bottomSheetController,
      required final List<CafeInfo> cafeInfos,
      required this.selectedMarker,
      required this.selectedCafeInfo,
      required this.mapController})
      : _cafeInfos = cafeInfos;

  @override
  final PanelController bottomSheetController;
  final List<CafeInfo> _cafeInfos;
  @override
  List<CafeInfo> get cafeInfos {
    if (_cafeInfos is EqualUnmodifiableListView) return _cafeInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cafeInfos);
  }

  @override
  final NMarker? selectedMarker;
  @override
  final CafeInfo selectedCafeInfo;
  @override
  final NaverMapController? mapController;

  @override
  String toString() {
    return 'MapState(bottomSheetController: $bottomSheetController, cafeInfos: $cafeInfos, selectedMarker: $selectedMarker, selectedCafeInfo: $selectedCafeInfo, mapController: $mapController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapState &&
            (identical(other.bottomSheetController, bottomSheetController) ||
                other.bottomSheetController == bottomSheetController) &&
            const DeepCollectionEquality()
                .equals(other._cafeInfos, _cafeInfos) &&
            (identical(other.selectedMarker, selectedMarker) ||
                other.selectedMarker == selectedMarker) &&
            (identical(other.selectedCafeInfo, selectedCafeInfo) ||
                other.selectedCafeInfo == selectedCafeInfo) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      bottomSheetController,
      const DeepCollectionEquality().hash(_cafeInfos),
      selectedMarker,
      selectedCafeInfo,
      mapController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapStateCopyWith<_$_MapState> get copyWith =>
      __$$_MapStateCopyWithImpl<_$_MapState>(this, _$identity);
}

abstract class _MapState implements MapState {
  factory _MapState(
      {required final PanelController bottomSheetController,
      required final List<CafeInfo> cafeInfos,
      required final NMarker? selectedMarker,
      required final CafeInfo selectedCafeInfo,
      required final NaverMapController? mapController}) = _$_MapState;

  @override
  PanelController get bottomSheetController;
  @override
  List<CafeInfo> get cafeInfos;
  @override
  NMarker? get selectedMarker;
  @override
  CafeInfo get selectedCafeInfo;
  @override
  NaverMapController? get mapController;
  @override
  @JsonKey(ignore: true)
  _$$_MapStateCopyWith<_$_MapState> get copyWith =>
      throw _privateConstructorUsedError;
}
