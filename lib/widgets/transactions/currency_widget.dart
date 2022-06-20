import 'package:bind_test/models/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyWidget extends StatelessWidget {
  const CurrencyWidget({
    Key? key,
    required this.currency,
    this.isMoneyHidden = false,
    required this.toggleVisibility,
  }) : super(key: key);

  final Currency currency;
  final bool isMoneyHidden;
  final void Function() toggleVisibility;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            currency.flagUrl ?? '',
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            errorBuilder: (context, _, trace) => const Icon(CupertinoIcons.exclamationmark_circle_fill),
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: 0.0,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(isMoneyHidden ? 'Show' : 'Hide'),
              ),
            ),
            Expanded(
              child: Text(
                currency.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16.0),
              ),
            ),
            GestureDetector(
              onTap: toggleVisibility,
              child: Container(
                margin: const EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.white.withOpacity(0.5)),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  isMoneyHidden ? 'Show' : 'Hide',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
