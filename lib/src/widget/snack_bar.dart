import 'package:flutter/material.dart';

Future<void> showSnackBar(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 5),
}) async {
  if (!context.mounted) return;
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
        duration: duration,
      ),
    );
}
