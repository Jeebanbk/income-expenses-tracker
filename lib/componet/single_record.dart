import 'package:expensesrecord/controller/transaction_controller.dart';
import 'package:expensesrecord/model/transaction.dart';
import 'package:flutter/material.dart';

class SingleRecord extends StatelessWidget {
  Transaction transaction;
  SingleRecord({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: (Icon(Icons.minimize)),
      title: Text(transaction.title),
      subtitle: Text(transaction.descrition),
      trailing: Text(transaction.amount.toString()),
    );
  }
}
