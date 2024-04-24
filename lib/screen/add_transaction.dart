import 'package:expensesrecord/controller/transaction_controller.dart';
import 'package:expensesrecord/model/transaction.dart';
import 'package:expensesrecord/utils/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransaction extends StatefulWidget {
  String title = '';
  String description = "";
  int amount;
  String type = "";
  AddTransaction(
      {super.key,
      this.title = '',
      this.description = "",
      this.amount =0,
      this.type = ""});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _keyform = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController typecontroller = TextEditingController();
  final TransactionController transactionController =
      Get.find<TransactionController>();
  void initState() {
    super.initState();
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    amountController.text = widget.amount.toString();
    typecontroller.text = widget.type;
  }

  void AddItem() {
    if (_keyform.currentState!.validate()) ;
    {
      Transaction transaction = Transaction(
          title: titleController.text,
          description: descriptionController.text,
          amount: int.parse(amountController.text),
          type: typecontroller.text);
      transactionController.add(transaction);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Transaction",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: themeColors,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 12, right: 12),
        child: Container(
          child: Form(
              key: _keyform,
              child: Column(
                children: [
                  TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                          labelText: "Enter title",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          filled: true)),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        labelText: "Enter Description",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    decoration: InputDecoration(
                        labelText: "Enter Amount",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        filled: true),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        AddItem();
                        Get.back();
                      },
                      child: const Text("ADD Transaction"))
                ],
              )),
        ),
      ),
    );
  }
}
