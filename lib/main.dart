import 'package:expensesrecord/componet/amount.dart';
import 'package:expensesrecord/componet/single_record.dart';
import 'package:expensesrecord/controller/transaction_controller.dart';
import 'package:expensesrecord/screen/add_transaction.dart';
import 'package:expensesrecord/utils/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            backgroundColor: themeColors,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return Amountwidget(
                              title: "Total Income",
                              bgColor: themeColors,
                              amount: transactionController.totalincome.value,
                              icons: Icon(Icons.money));
                        }),
                        Obx(() {
                          return Amountwidget(
                              title: "Total Expenses",
                              bgColor: Colors.redAccent,
                              amount: transactionController.totalexpenses.value,
                              icons: Icon(Icons.money));
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Transaction",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 8, right: 5),
                    child: Obx(() {
                      return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SingleRecord(
                                transaction:
                                    transactionController.transaction[index]);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 15);
                          },
                          itemCount: transactionController.transaction.length);
                    }),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(AddTransaction());
            },
            child: Icon(Icons.add),
          )),
    );
  }
}
