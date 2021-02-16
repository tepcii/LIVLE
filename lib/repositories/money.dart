import 'package:cloud_firestore/cloud_firestore.dart';

class Money {
  Money({
    this.id,
    this.amount,
    this.title,
    this.date,
    this.memo,
    this.artistId,
  });

  String id;
  int amount;
  String title;
  Timestamp date;
  String memo;
  String artistId;
}
