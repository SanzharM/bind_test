import 'package:bind_test/models/transaction.dart';
import 'package:bind_test/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LineCell extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final Widget? icon;
  final Widget? leading;
  final String? subtitle;
  final bool needIcon;
  final double? iconPadding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool needBorder;
  final BoxConstraints? constraints;
  final Color? fillColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final MainAxisAlignment? mainAxisAlignment;

  const LineCell({
    Key? key,
    required this.title,
    required this.onTap,
    this.icon,
    this.leading,
    this.subtitle,
    this.needIcon = true,
    this.iconPadding,
    this.fontSize,
    this.fontWeight,
    this.needBorder = false,
    this.constraints,
    this.fillColor,
    this.textColor,
    this.borderRadius,
    this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: constraints,
        padding: const EdgeInsets.all(16.0).copyWith(right: iconPadding),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
          color: fillColor ?? Colors.white,
          border: needBorder ? Border.all(color: Colors.white.withOpacity(0.5)) : null,
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leading != null)
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: leading!,
                ),
              ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize ?? 16,
                      fontWeight: fontWeight ?? FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                  if (subtitle?.isNotEmpty ?? false)
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: fontSize ?? 13,
                        fontWeight: fontWeight ?? FontWeight.w300,
                        color: textColor,
                      ),
                    ),
                ],
              ),
            ),
            if (needIcon)
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: icon ?? const Icon(Icons.chevron_right_sharp, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TransactionCell extends StatelessWidget {
  const TransactionCell({Key? key, required this.transaction}) : super(key: key);

  final Transaction transaction;

  String getAmount() => '${transaction.type == TransactionType.income ? "+" : "-"} '
      '${transaction.currency?.symbol ?? ''}${transaction.amount} '
      '${transaction.currency?.shortTitle ?? ''}';

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 0.5, color: Colors.grey),
              ),
              child: ClipOval(child: transaction.getImage(width: 36, height: 36)),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name ?? '',
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                Text(
                  Utils.getTimeFromDate(transaction.dateTime),
                  style: TextStyle(fontSize: 13.0, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            flex: 3,
            child: Text(
              getAmount(),
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
