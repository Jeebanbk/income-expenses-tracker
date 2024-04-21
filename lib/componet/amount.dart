import 'package:expensesrecord/utils/mainColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Amountwidget extends StatelessWidget {
  String title;
  Color bgColor;
  int amount;
  Icon icons;
  Amountwidget(
      {super.key,
      required this.title,
      required this.amount,
      required this.bgColor,
      required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: bgColor , borderRadius: BorderRadiusDirectional.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          Text(
            amount.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
