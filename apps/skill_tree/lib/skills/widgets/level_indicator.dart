import 'package:flutter/material.dart';
import 'package:skill_tree/utils/color_helpers.dart';

class LevelIndicator extends StatelessWidget {
  const LevelIndicator({
    required this.level,
    required this.backgroundColorHex,
    super.key,
  });

  final int level;
  final String backgroundColorHex;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = hexToColor(backgroundColorHex);
    return CircleAvatar(
      radius: 24,
      backgroundColor: backgroundColor,
      child: Center(
        child: Text(
          level.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: getContrastingTextColor(backgroundColor),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
