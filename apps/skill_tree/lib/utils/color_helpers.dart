import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  // Clean the hex string by removing the leading '#' if present
  var cleanedHex = hex.replaceFirst('#', '');

  // If the hex color is in short format (6 characters), prepend the alpha value 'FF'
  if (cleanedHex.length == 6) {
    cleanedHex = 'FF$cleanedHex';
  }

  // Parse the hex string to an integer and return as a Color object
  return Color(int.parse(cleanedHex, radix: 16));
}

Color getContrastingTextColor(Color backgroundColor) {
  final luminance = backgroundColor.computeLuminance();
  return luminance > 0.5 ? Colors.black : Colors.white;
}
