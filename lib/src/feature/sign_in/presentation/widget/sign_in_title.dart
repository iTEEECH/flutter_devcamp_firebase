import 'package:flutter/material.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome on Sign in page',
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }
}
