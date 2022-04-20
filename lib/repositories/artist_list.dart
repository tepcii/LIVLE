import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livle/repositories/artist.dart';
import 'package:livle/source/artist.dart';
import 'package:livle/source/interfaces/artist.dart';

part 'artist_list.freezed.dart';
part 'artist_list.g.dart';

class ArtistRepository extends ChangeNotifier {
  ArtistRepository({
    required this.source,
    required ArtistList artistList,
  }) : _artistList = artistList;

  IArtistDataSource source;
  ArtistList _artistList;

  ArtistList get artistList => _artistList;
  set artistList(ArtistList value) {
    _artistList = value;
    notifyListeners();
  }
}

@freezed
abstract class ArtistList with _$ArtistList {
  const factory ArtistList({
    @ArtistsConverter() @Default(<Artist>[]) List<Artist> artists,
  }) = _ArtistList;
  const ArtistList._();

  factory ArtistList.fromJson(Map<String, dynamic> json) => _$ArtistListFromJson(json);

  Artist getArtistById(String id) {
    return artists.firstWhere((Artist e) => e.id == id);
  }
}

final Provider<ArtistRepository> artistsRepositoryProvider = Provider<ArtistRepository>(
  (ProviderRef<ArtistRepository> ref) => ArtistRepository(
    source: ArtistDataSource(),
    artistList: const ArtistList(),
  ),
);

class ArtistsConverter implements JsonConverter<List<Artist>, List<dynamic>> {
  const ArtistsConverter();

  @override
  List<Artist> fromJson(List<dynamic> json) {
    return json
        .map<Artist>((dynamic e) => Artist(
              id: e['id'] as String,
              name: e['name'] as String,
              description: e['description'] as String,
              iconImagePath: e['iconImagePath'] as String,
              color: e['color'] as int,
            ))
        .toList();
  }

  @override
  List<dynamic> toJson(List<Artist> data) => data;
}
