import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ScreenNavigationUtils {
  static Future<T?> push<T>(
      BuildContext context, {
        required Widget child,
        PageTransitionType type = PageTransitionType.rightToLeft,
      }) {
    return Navigator.push<T>(
      context,
      PageTransition(
        type: type,
        child: child,
        duration: const Duration(milliseconds: 700),
        reverseDuration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      ),
    );
  }


  static Future<T?> pushReplacement<T>(
      BuildContext context, {
        required Widget child,
        PageTransitionType type = PageTransitionType.rightToLeft,
      }) {
    return Navigator.pushReplacement<T, T>(
      context,
      PageTransition(
        type: type,
        child: child,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ),
    );
  }
}
