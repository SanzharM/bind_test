import 'package:bind_test/models/transaction.dart';
import 'package:bind_test/utils.dart';
import 'package:bind_test/widgets/cells.dart';
import 'package:flutter/material.dart';

class TransactionBuilder extends StatelessWidget {
  const TransactionBuilder({Key? key, required this.transactions}) : super(key: key);

  final Map<DateTime, List<Transaction>> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: transactions.keys.length,
      itemBuilder: (_, i) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0).copyWith(bottom: 16.0),
              decoration: const BoxDecoration(color: Colors.grey),
              alignment: Alignment.centerLeft,
              child: Text(
                Utils.toDatePointer(transactions.keys.elementAt(i)),
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.values.elementAt(i).length,
              separatorBuilder: (_, iter) => const Divider(height: 2.0),
              itemBuilder: (_, j) {
                final dateTransactions = transactions.values.elementAt(i);
                return TransactionCell(transaction: dateTransactions[j]);
              },
            ),
          ],
        );
      },
    );
  }
}
