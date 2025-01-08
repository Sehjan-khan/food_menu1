import 'package:flutter/material.dart';

SnackBar customSnackBar({
  required String message,
  Color backgroundColor = Colors.black,
  Duration duration = const Duration(seconds: 2),
  String actionLabel = 'Undo',
  VoidCallback? onActionPressed,
}) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    duration: duration,
    action: SnackBarAction(
      label: actionLabel,
      textColor: const Color(0xFFFF7043),
      onPressed: onActionPressed ?? () {},
    ),
  );
}
