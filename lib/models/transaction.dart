import 'package:bind_test/models/currency.dart';
import 'package:flutter/cupertino.dart';

enum TransactionType { income, outcome }

class Transaction {
  final String? name;
  final int? id;
  final TransactionType type;
  final double? amount;
  final DateTime? dateTime;
  final String? imageUrl;
  final Currency? currency;

  const Transaction({this.id, this.name, this.type = TransactionType.outcome, this.amount, this.dateTime, this.imageUrl, this.currency});

  Widget getImage({double? width, double? height}) {
    return Image.network(
      imageUrl ?? '',
      fit: BoxFit.cover,
      height: height,
      width: width,
      loadingBuilder: (context, widget, chunk) {
        if (chunk == null) return widget;
        return SizedBox(
          height: height,
          width: width,
          child: const CupertinoActivityIndicator(),
        );
      },
      errorBuilder: (context, object, trace) => SizedBox(
        height: height,
        width: width,
        child: const Icon(CupertinoIcons.exclamationmark_circle_fill),
      ),
    );
  }
}
