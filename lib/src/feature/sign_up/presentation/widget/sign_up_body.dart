import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_up/sign_up.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SignUpForm(),
      ],
    );
  }
}
