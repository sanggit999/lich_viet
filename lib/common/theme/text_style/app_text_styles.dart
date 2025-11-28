import 'package:flutter/material.dart';
import 'package:lich_viet/gen/fonts.gen.dart';

class AppTextStyles {
  // Heading styles
  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -0.28, // -1% của fontSize: fontSize * -0.01
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -0.24,
  );

  // Title styles
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -0.20,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -0.18,
  );

  // Body styles
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -0.14,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -0.16,
  );

  // Small styles
  static const TextStyle small = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.inter,
    height: 1.4,
    letterSpacing: -0.12,
  );
}
