import 'package:livle/repositories/artist.dart';

abstract class IArtistDataSource {
  Future<Map<String, dynamic>> fetch();
  Future<bool> add(Artist money);
  Future<bool> delete(Artist money);
}
