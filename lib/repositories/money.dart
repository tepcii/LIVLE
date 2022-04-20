import 'package:cloud_firestore/cloud_firestore.dart';

class Money {
  Money({
    required this.id,
    required this.amount,
    required this.title,
    required this.date,
    required this.memo,
    required this.artistId,
  });

  String id;
  int amount;
  String title;
  Timestamp date;
  String memo;
  String artistId;
}
