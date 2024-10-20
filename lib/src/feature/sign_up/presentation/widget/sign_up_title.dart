import 'package:flutter/material.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome on Sign up page.',
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }
}