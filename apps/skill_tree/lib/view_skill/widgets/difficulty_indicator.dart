import 'package:flutter/material.dart';
import 'package:skill_tree/utils/color_helpers.dart';

class DifficultyIndicator extends StatelessWidget {
  const DifficultyIndicator({
    required this.colorHex,
    required this.difficultyText,
    super.key,
  });

  final String colorHex;
  final String difficultyText;

  @override
  Widget build(BuildContext context) {
    final color = hexToColor(colorHex);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          difficultyText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: getContrastingTextColor(color),
          ),
        ),
      ),
    );
  }
}
