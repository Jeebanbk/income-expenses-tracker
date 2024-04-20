import 'package:expensesrecord/componet/single_record.dart';
import 'package:expensesrecord/controller/transaction_controller.dart';
import 'package:expensesrecord/screen/add_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  TransactionController transactionController =
      Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Income/Expenses Tracker",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Transaction",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Obx(() {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SingleRecord(
                            transaction:
                                transactionController.transaction[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 15);
                      },
                      itemCount: transactionController.transaction.length);
                })
              ],
            ),
          ),
        ),
        floatingActionButton: IconButton(
            onPressed: () {
              Get.to(() => const AddTransaction());
            },
            icon: Icon(Icons.add)),
      ),
    );
  }
}
