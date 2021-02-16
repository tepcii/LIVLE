// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtistList _$_$_ArtistListFromJson(Map<String, dynamic> json) {
  return _$_ArtistList(
    artists: const ArtistsConverter().fromJson(json['artists'] as List) ?? [],
  );
}

Map<String, dynamic> _$_$_ArtistListToJson(_$_ArtistList instance) =>
    <String, dynamic>{
      'artists': const ArtistsConverter().toJson(instance.artists),
    };
