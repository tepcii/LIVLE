import 'package:flutter/material.dart';
import 'package:livle/repositories/grouped_money.dart';

class MoneyListTile extends StatelessWidget {
  const MoneyListTile({
    Key? key,
    required this.groupedMoney,
    required this.onTap,
  }) : super(key: key);

  final GroupedMoney groupedMoney;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails detail) => onTap(),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
        ),
        child: ListTile(
          leading: Icon(
            Icons.circle,
            color: Color(groupedMoney.artist.color),
          ),
          title: Text(groupedMoney.artist.name),
          subtitle: Text('${groupedMoney.totalAmount.toString()}円'),
        ),
      ),
    );
  }
}
