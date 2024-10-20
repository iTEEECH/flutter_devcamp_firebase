import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/core/utils/validator.dart';

class SignInEmailField extends StatelessWidget {
  final TextEditingController controller;

  const SignInEmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => Validator.email(value),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Email',
      ),
    );
  }
}