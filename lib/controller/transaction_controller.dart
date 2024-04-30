import 'package:expensesrecord/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  List transactions = <Transaction>[].obs;
  RxInt totalincome = 0.obs;
  RxInt totalexpenses = 0.obs;

  @override
  void onInit() {
    calculateTotalIncome();

    super.onInit();
  }

  void add(Transaction transaction) {
    transactions.add(transaction);
    calculateTotalExpenes();
    calculateTotalIncome();
  }

  void calculateTotalIncome() {
    var count = 0;
    for (var transaction in transactions) {
      if (transaction.type == "income") {
        count += int.parse(transaction.amount);
      }
    }
    totalincome.value = count.toInt();
  }

  void calculateTotalExpenes() {
    var count = 0;
    for (var transaction in transactions) {
      if (transaction.type == "expenses") {
        count += int.parse(transaction.amount);
      }
    }
    totalexpenses.value = count.toInt();
  }
}
