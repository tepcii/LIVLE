import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'money.freezed.dart';

class Money {
  Money({this.amount, this.title, this.date, this.memo});
  int amount;
  String title;
  Timestamp date;
  String memo;
}

// @freezed
// abstract class Money with _$Money {
//   const factory Money({
//     int amount,
//     String title,
//     Timestamp date,
//     String memo,
//   }) = _Money;
// }
