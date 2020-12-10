import 'package:livle/repositories/user.dart';

abstract class IUserDataSource {
  Future<bool> registerUser(OriginUser user);
  Future<bool> updateUser(OriginUser user);
}
