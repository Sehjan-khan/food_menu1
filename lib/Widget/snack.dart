import 'package:flutter/material.dart';

SnackBar customSnackBar({
  required String message,
  Color backgroundColor = Colors.black,
  Duration duration = const Duration(seconds: 2),
}) {
  return SnackBar(
    content: Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center, // Ensures text is centered within the widget
      ),
    ),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    duration: duration,
  );
}
