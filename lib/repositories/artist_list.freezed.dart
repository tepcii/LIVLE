// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'artist_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArtistList _$ArtistListFromJson(Map<String, dynamic> json) {
  return _ArtistList.fromJson(json);
}

/// @nodoc
mixin _$ArtistList {
  @ArtistsConverter()
  List<Artist> get artists => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistListCopyWith<ArtistList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistListCopyWith<$Res> {
  factory $ArtistListCopyWith(
          ArtistList value, $Res Function(ArtistList) then) =
      _$ArtistListCopyWithImpl<$Res>;
  $Res call({@ArtistsConverter() List<Artist> artists});
}

/// @nodoc
class _$ArtistListCopyWithImpl<$Res> implements $ArtistListCopyWith<$Res> {
  _$ArtistListCopyWithImpl(this._value, this._then);

  final ArtistList _value;
  // ignore: unused_field
  final $Res Function(ArtistList) _then;

  @override
  $Res call({
    Object? artists = freezed,
  }) {
    return _then(_value.copyWith(
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
    ));
  }
}

/// @nodoc
abstract class _$ArtistListCopyWith<$Res> implements $ArtistListCopyWith<$Res> {
  factory _$ArtistListCopyWith(
          _ArtistList value, $Res Function(_ArtistList) then) =
      __$ArtistListCopyWithImpl<$Res>;
  @override
  $Res call({@ArtistsConverter() List<Artist> artists});
}

/// @nodoc
class __$ArtistListCopyWithImpl<$Res> extends _$ArtistListCopyWithImpl<$Res>
    implements _$ArtistListCopyWith<$Res> {
  __$ArtistListCopyWithImpl(
      _ArtistList _value, $Res Function(_ArtistList) _then)
      : super(_value, (v) => _then(v as _ArtistList));

  @override
  _ArtistList get _value => super._value as _ArtistList;

  @override
  $Res call({
    Object? artists = freezed,
  }) {
    return _then(_ArtistList(
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArtistList extends _ArtistList {
  const _$_ArtistList(
      {@ArtistsConverter() final List<Artist> artists = const <Artist>[]})
      : _artists = artists,
        super._();

  factory _$_ArtistList.fromJson(Map<String, dynamic> json) =>
      _$$_ArtistListFromJson(json);

  @ArtistsConverter()
  final List<Artist> _artists;
  @override
  @JsonKey()
  @ArtistsConverter()
  List<Artist> get artists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  String toString() {
    return 'ArtistList(artists: $artists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArtistList &&
            const DeepCollectionEquality().equals(other.artists, artists));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(artists));

  @JsonKey(ignore: true)
  @override
  _$ArtistListCopyWith<_ArtistList> get copyWith =>
      __$ArtistListCopyWithImpl<_ArtistList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtistListToJson(this);
  }
}

abstract class _ArtistList extends ArtistList {
  const factory _ArtistList({@ArtistsConverter() final List<Artist> artists}) =
      _$_ArtistList;
  const _ArtistList._() : super._();

  factory _ArtistList.fromJson(Map<String, dynamic> json) =
      _$_ArtistList.fromJson;

  @override
  @ArtistsConverter()
  List<Artist> get artists => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ArtistListCopyWith<_ArtistList> get copyWith =>
      throw _privateConstructorUsedError;
}
