import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  Schedule({
    required this.id,
    required this.title,
    required this.date,
    required this.memo,
    required this.artistId,
  });

  String id;
  String title;
  Timestamp date;
  String memo;
  String artistId;
}
