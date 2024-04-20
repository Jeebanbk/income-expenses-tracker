import 'package:expensesrecord/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  List transaction = <Transaction>[].obs;
  List<Transaction> dummydata = [
    Transaction(
        title: "momo", descrition: "tasty momo", amount: 400, type: "income")
  ];

  @override
  void onInit() {
    transaction.assignAll(dummydata);

    super.onInit();
  }
}
