import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_up/presentation/widget/sign_up_form.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_up/presentation/widget/sign_up_title.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SignUpTitle(),
        SizedBox(height: 24.0),
        SignUpForm(),
      ],
    );
  }
}
