import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration underline;
  const TextUtils(
      {required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.color,
      required this.underline,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
            decoration: underline,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight),
      ),
    );
  }
}
