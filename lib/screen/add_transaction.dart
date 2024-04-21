import 'package:expensesrecord/utils/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _keyform = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descritionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
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
                      onPressed: () {}, child: const Text("ADD Transaction"))
                ],
              )),
        ),
      ),
    );
  }
}
