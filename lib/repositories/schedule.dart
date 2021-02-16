import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  Schedule({
    this.id,
    this.title,
    this.date,
    this.memo,
  });

  String id;
  String title;
  Timestamp date;
  String memo;
}
