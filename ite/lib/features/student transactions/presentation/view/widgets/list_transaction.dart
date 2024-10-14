import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ite/features/student%20transactions/presentation/view/add_transaction_order.dart';
import 'package:ite/features/student%20transactions/presentation/view/widgets/custom_transaction.dart';

class ListTransactionsTypes extends StatelessWidget {
  ListTransactionsTypes({super.key});
  final List<String> type = [
    'مصدقة دوام',
    'حياة جامعية',
    'بدل ضائع',
    'بدل تالف'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: type.length,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return AddTransactionOrder(type: type[index],);
                  },
                ));
              },
              child: CustomTransaction(text: type[index]));
        },
      ),
    );
  }
}
