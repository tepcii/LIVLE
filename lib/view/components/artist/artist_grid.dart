import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/providers/view_model/artist.dart';
import 'package:livle/repositories/artist.dart';
import 'package:livle/view/components/artist/artist_grid_tile.dart';

class ArtistGrid extends HookConsumerWidget {
  const ArtistGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ArtistViewModel _artistViewModel = ref.watch(artistViewModelNotifierProvider);
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
