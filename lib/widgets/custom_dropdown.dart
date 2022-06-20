import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({Key? key, required this.child, required this.onTap, this.color, this.backgroundColor}) : super(key: key);

  final Widget child;
  final void Function() onTap;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48.0, minWidth: 48.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.white.withOpacity(0.5)),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: child),
            Icon(CupertinoIcons.chevron_down, size: 18.0, color: color),
          ],
        ),
      ),
    );
  }
}
