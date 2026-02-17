import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flutter/material.dart';

class CommonBoxDecorations {
  static BoxDecoration screenBackgroundDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFFFFFFF),
        Color(0xFFF8F8FF),
      ],
      stops: [0.0, 1.0],
    ),
  );

  static BoxDecoration textFieldDecorationDecoration = BoxDecoration(
    color: ColorUtils.white,
    borderRadius: BorderRadius.circular(30),
    border: Border.all(
      color: const Color(0xFFEAECF0),
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: const Color(0xFF43474D).withOpacity(0.06),
        blurRadius: 60,
        offset: const Offset(0, 12),
      ),
    ],
  );
}
