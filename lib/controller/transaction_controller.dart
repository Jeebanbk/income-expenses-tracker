import 'package:expensesrecord/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  List transaction = <Transaction>[].obs;
  RxInt totalincome = 0.obs;
  RxInt totalexpenses = 0.obs;
  List<Transaction> dummydata = [
    Transaction(
        title: "salary", descrition: "1 months", amount: 60000, type: "income"),
    Transaction(
        title: "momo", descrition: "tasty momo", amount: 400, type: "expenses"),
    Transaction(
        title: "share", descrition: "mbjc", amount: 4000, type: "income"),
    Transaction(
        title: "mobile",
        descrition: "samsung s24",
        amount: 20000,
        type: "expenses")
  ];

  @override
  void onInit() {
    transaction.assignAll(dummydata);
    CalculateTotalIncome();

    super.onInit();
  }

  void CalculateTotalIncome() {}
  void calculateTotalExpenes() {}
}
