// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Brand> get brandList => throw _privateConstructorUsedError;
  List<Item> get itemList => throw _privateConstructorUsedError;
  List<Brandcon> get myBrandcons => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopStateCopyWith<ShopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopStateCopyWith<$Res> {
  factory $ShopStateCopyWith(ShopState value, $Res Function(ShopState) then) =
      _$ShopStateCopyWithImpl<$Res, ShopState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Brand> brandList,
      List<Item> itemList,
      List<Brandcon> myBrandcons});
}

/// @nodoc
class _$ShopStateCopyWithImpl<$Res, $Val extends ShopState>
    implements $ShopStateCopyWith<$Res> {
  _$ShopStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? brandList = null,
    Object? itemList = null,
    Object? myBrandcons = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brandList: null == brandList
          ? _value.brandList
          : brandList // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      itemList: null == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      myBrandcons: null == myBrandcons
          ? _value.myBrandcons
          : myBrandcons // ignore: cast_nullable_to_non_nullable
              as List<Brandcon>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopStateImplCopyWith<$Res>
    implements $ShopStateCopyWith<$Res> {
  factory _$$ShopStateImplCopyWith(
          _$ShopStateImpl value, $Res Function(_$ShopStateImpl) then) =
      __$$ShopStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Brand> brandList,
      List<Item> itemList,
      List<Brandcon> myBrandcons});
}

/// @nodoc
class __$$ShopStateImplCopyWithImpl<$Res>
    extends _$ShopStateCopyWithImpl<$Res, _$ShopStateImpl>
    implements _$$ShopStateImplCopyWith<$Res> {
  __$$ShopStateImplCopyWithImpl(
      _$ShopStateImpl _value, $Res Function(_$ShopStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? brandList = null,
    Object? itemList = null,
    Object? myBrandcons = null,
  }) {
    return _then(_$ShopStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brandList: null == brandList
          ? _value._brandList
          : brandList // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      itemList: null == itemList
          ? _value._itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      myBrandcons: null == myBrandcons
          ? _value._myBrandcons
          : myBrandcons // ignore: cast_nullable_to_non_nullable
              as List<Brandcon>,
    ));
  }
}

/// @nodoc

class _$ShopStateImpl implements _ShopState {
  _$ShopStateImpl(
      {required this.isLoading,
      required final List<Brand> brandList,
      required final List<Item> itemList,
      required final List<Brandcon> myBrandcons})
      : _brandList = brandList,
        _itemList = itemList,
        _myBrandcons = myBrandcons;

  @override
  final bool isLoading;
  final List<Brand> _brandList;
  @override
  List<Brand> get brandList {
    if (_brandList is EqualUnmodifiableListView) return _brandList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brandList);
  }

  final List<Item> _itemList;
  @override
  List<Item> get itemList {
    if (_itemList is EqualUnmodifiableListView) return _itemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemList);
  }

  final List<Brandcon> _myBrandcons;
  @override
  List<Brandcon> get myBrandcons {
    if (_myBrandcons is EqualUnmodifiableListView) return _myBrandcons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myBrandcons);
  }

  @override
  String toString() {
    return 'ShopState(isLoading: $isLoading, brandList: $brandList, itemList: $itemList, myBrandcons: $myBrandcons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._brandList, _brandList) &&
            const DeepCollectionEquality().equals(other._itemList, _itemList) &&
            const DeepCollectionEquality()
                .equals(other._myBrandcons, _myBrandcons));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_brandList),
      const DeepCollectionEquality().hash(_itemList),
      const DeepCollectionEquality().hash(_myBrandcons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopStateImplCopyWith<_$ShopStateImpl> get copyWith =>
      __$$ShopStateImplCopyWithImpl<_$ShopStateImpl>(this, _$identity);
}

abstract class _ShopState implements ShopState {
  factory _ShopState(
      {required final bool isLoading,
      required final List<Brand> brandList,
      required final List<Item> itemList,
      required final List<Brandcon> myBrandcons}) = _$ShopStateImpl;

  @override
  bool get isLoading;
  @override
  List<Brand> get brandList;
  @override
  List<Item> get itemList;
  @override
  List<Brandcon> get myBrandcons;
  @override
  @JsonKey(ignore: true)
  _$$ShopStateImplCopyWith<_$ShopStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
