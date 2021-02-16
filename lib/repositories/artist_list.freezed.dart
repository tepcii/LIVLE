// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'artist_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ArtistList _$ArtistListFromJson(Map<String, dynamic> json) {
  return _ArtistList.fromJson(json);
}

/// @nodoc
class _$ArtistListTearOff {
  const _$ArtistListTearOff();

// ignore: unused_element
  _ArtistList call(
      {@ArtistsConverter() List<Artist> artists = const <Artist>[]}) {
    return _ArtistList(
      artists: artists,
    );
  }

// ignore: unused_element
  ArtistList fromJson(Map<String, Object> json) {
    return ArtistList.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ArtistList = _$ArtistListTearOff();

/// @nodoc
mixin _$ArtistList {
  @ArtistsConverter()
  List<Artist> get artists;

  Map<String, dynamic> toJson();
  $ArtistListCopyWith<ArtistList> get copyWith;
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
    Object artists = freezed,
  }) {
    return _then(_value.copyWith(
      artists: artists == freezed ? _value.artists : artists as List<Artist>,
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
    Object artists = freezed,
  }) {
    return _then(_ArtistList(
      artists: artists == freezed ? _value.artists : artists as List<Artist>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ArtistList implements _ArtistList {
  const _$_ArtistList({@ArtistsConverter() this.artists = const <Artist>[]})
      : assert(artists != null);

  factory _$_ArtistList.fromJson(Map<String, dynamic> json) =>
      _$_$_ArtistListFromJson(json);

  @JsonKey(defaultValue: const <Artist>[])
  @override
  @ArtistsConverter()
  final List<Artist> artists;

  @override
  String toString() {
    return 'ArtistList(artists: $artists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ArtistList &&
            (identical(other.artists, artists) ||
                const DeepCollectionEquality().equals(other.artists, artists)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(artists);

  @override
  _$ArtistListCopyWith<_ArtistList> get copyWith =>
      __$ArtistListCopyWithImpl<_ArtistList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ArtistListToJson(this);
  }
}

abstract class _ArtistList implements ArtistList {
  const factory _ArtistList({@ArtistsConverter() List<Artist> artists}) =
      _$_ArtistList;

  factory _ArtistList.fromJson(Map<String, dynamic> json) =
      _$_ArtistList.fromJson;

  @override
  @ArtistsConverter()
  List<Artist> get artists;
  @override
  _$ArtistListCopyWith<_ArtistList> get copyWith;
}
