import 'package:livle/repositories/schedule.dart';
import 'package:livle/source/interfaces/schedule.dart';

class ScheduleDataSource implements IScheduleDataSource {
  @override
  Future<bool> add(Schedule schedule) async {
    return true;
  }

  @override
  Future<bool> delete(Schedule schedule) async {
    return true;
  }
}
