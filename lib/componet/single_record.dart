import 'package:expensesrecord/controller/transaction_controller.dart';
import 'package:expensesrecord/model/transaction.dart';
import 'package:expensesrecord/utils/mainColors.dart';
import 'package:flutter/material.dart';

class SingleRecord extends StatelessWidget {
  Transaction transaction;
  SingleRecord({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 106, 174, 141)),
      child: ListTile(
        leading: Icon(
          transaction.type == "income" ? Icons.add : Icons.minimize_outlined,
          color: transaction.type == "income" ? Colors.black : Colors.redAccent,
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          transaction.descrition,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          transaction.amount.toString(),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: transaction.type == "income"
                  ? Colors.black
                  : Colors.redAccent),
        ),
      ),
    );
  }
}
