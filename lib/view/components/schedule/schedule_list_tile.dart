import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livle/repositories/schedule.dart';

class ScheduleListTile extends StatelessWidget {
  const ScheduleListTile({
    Key key,
    this.schedule,
  }) : super(key: key);

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.grey[200],
            ),
          ),
        ),
        child: ListTile(
          title: Text(schedule.title),
          subtitle: Text(DateFormat('yyyy年MM月dd日').format(schedule.date.toDate())),
        ),
      ),
    );
  }
}
