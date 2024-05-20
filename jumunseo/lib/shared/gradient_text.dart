import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:jumunseo/config/theme/app_color.dart';

Widget gradientText(String text, double size) {
  final Shader linearGradientShader = ui.Gradient.linear(
      const Offset(0, 20),
      const Offset(150, 20),
      [ColorStyles.mainColor, ColorStyles.secondMainColor]);
  return Text(text,
      style: TextStyle(
          fontFamily: 'Pretendard',
          foreground: Paint()..shader = linearGradientShader,
          fontSize: size,
          fontWeight: FontWeight.bold));
}
