import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.text, this.alignment, this.textColor, this.fontWeight}) : super(key: key);

  final String text;
  final Alignment? alignment;
  final Color? textColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0, fontWeight: fontWeight ?? FontWeight.w500, color: textColor),
      ),
    );
  }
}
