import 'package:flutter/material.dart';

extension ThemeColorExtension on ThemeData {
  Color successColor(Color? color) {
    return color ?? const Color.fromARGB(255, 255, 255, 255);
  }
}
