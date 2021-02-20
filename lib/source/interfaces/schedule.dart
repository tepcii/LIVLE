import 'package:livle/repositories/schedule.dart';

abstract class IScheduleDataSource {
  Future<bool> add(Schedule schedule);
  Future<bool> delete(Schedule schedule);
  Future<bool> init();
}
