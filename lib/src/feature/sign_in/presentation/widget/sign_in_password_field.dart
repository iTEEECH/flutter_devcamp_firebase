import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/core/utils/validator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignInPasswordField extends HookWidget {
  final TextEditingController controller;

  const SignInPasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscureText = useState<bool>(true);

    return TextFormField(
      controller: controller,
      obscureText: obscureText.value,
      validator: (value) => Validator.password(value),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Password',
        suffixIcon: GestureDetector(
          onTap: () => obscureText.value = !obscureText.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Icon(
              obscureText.value ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
