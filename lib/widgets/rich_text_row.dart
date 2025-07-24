import 'package:flutter/material.dart';

class RichTextRow extends StatelessWidget {
  final Color? textColor;
  final double fontSize;
  final FontWeight firstFontWeight;
  final FontWeight secondFontWeight;
  final String firstText;
  final String secondText;

  const RichTextRow({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.fontSize,
    this.firstFontWeight = FontWeight.bold,
    this.secondFontWeight = FontWeight.normal,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: fontSize, color: textColor),
            children: [
              TextSpan(
                text: firstText,
                style: TextStyle(fontWeight: firstFontWeight),
                children: [
                  TextSpan(
                    text: secondText, //810 ohne Home
                    style: TextStyle(fontWeight: secondFontWeight),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
