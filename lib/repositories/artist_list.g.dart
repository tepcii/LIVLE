// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtistList _$$_ArtistListFromJson(Map<String, dynamic> json) =>
    _$_ArtistList(
      artists: json['artists'] == null
          ? const <Artist>[]
          : const ArtistsConverter().fromJson(json['artists'] as List),
    );

Map<String, dynamic> _$$_ArtistListToJson(_$_ArtistList instance) =>
    <String, dynamic>{
      'artists': const ArtistsConverter().toJson(instance.artists),
    };
