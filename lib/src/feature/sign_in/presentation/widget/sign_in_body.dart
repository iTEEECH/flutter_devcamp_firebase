import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_in/sign_in.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SignInTitle(),
        SizedBox(height: 24.0),
        SignInLogo(),
        SizedBox(height: 24.0),
        SignInForm(),
        Spacer(),
        SignInNoAccount(),
      ],
    );
  }
}
