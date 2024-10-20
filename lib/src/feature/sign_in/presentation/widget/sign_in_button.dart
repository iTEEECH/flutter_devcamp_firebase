import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const SignInButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Sign In'),
    );
  }
}
