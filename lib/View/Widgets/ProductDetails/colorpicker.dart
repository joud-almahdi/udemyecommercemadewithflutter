import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker(
      {required this.color, required this.outerBorder, super.key});
  final bool outerBorder;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: outerBorder ? Border.all(color: color, width: 2) : null,
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
