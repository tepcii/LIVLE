import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:livle/providers/view_model/artist.dart';
import 'package:livle/repositories/artist.dart';
import 'package:livle/view/components/artist/artist_grid_tile.dart';

class ArtistGrid extends ConsumerWidget {
  const ArtistGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final ArtistViewModel _artistViewModel = watch(artistViewModelNotifierProvider);
    final List<Artist> _artists = _artistViewModel.artistRepository.artistList.artists;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: _artists.length,
      itemBuilder: (BuildContext context, int index) {
        return ArtistGridTile(artist: _artists[index]);
      },
    );
  }
}
