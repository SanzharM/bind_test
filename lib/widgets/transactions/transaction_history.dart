import 'package:bind_test/models/currency.dart';
import 'package:bind_test/widgets/custom_dropdown.dart';
import 'package:bind_test/widgets/section_title.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({
    Key? key,
    required this.currency,
    required this.chooseCurrency,
    required this.chooseDateFilter,
    required this.chooseTransactionType,
  }) : super(key: key);

  final Currency currency;
  final void Function() chooseCurrency;
  final void Function() chooseTransactionType;
  final void Function() chooseDateFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(text: 'Transactions history', textColor: Colors.white),
        const SizedBox(height: 16.0),
        CustomDropdown(
          child: Text(currency.toString(), style: const TextStyle(color: Colors.white)),
          color: Colors.white,
          onTap: chooseCurrency,
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomDropdown(
                child: const Text('All', style: TextStyle(color: Colors.white)),
                color: Colors.white,
                onTap: chooseTransactionType,
              ),
            ),
            const SizedBox(width: 16.0),
            GestureDetector(
              onTap: chooseDateFilter,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.white.withOpacity(0.5)),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Icon(Icons.calendar_today_rounded, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
