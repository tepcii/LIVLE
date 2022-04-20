import 'package:flutter/material.dart';
import 'package:livle/repositories/artist.dart';

class ArtistGridTile extends StatelessWidget {
  const ArtistGridTile({
    Key? key,
    required this.artist,
  }) : super(key: key);

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Text(artist.name),
    );
  }
}
