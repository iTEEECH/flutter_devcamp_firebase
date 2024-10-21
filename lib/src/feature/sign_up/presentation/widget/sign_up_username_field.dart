import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/core/utils/validator.dart';

class SignUpUsernameField extends StatelessWidget {
  final TextEditingController controller;

  const SignUpUsernameField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => Validator.username(value),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Username',
      ),
    );
  }
}
