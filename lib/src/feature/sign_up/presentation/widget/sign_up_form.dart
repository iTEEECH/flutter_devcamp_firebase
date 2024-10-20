import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_up/sign_up.dart';
import 'package:flutter_devcamp_firebase/src/widget/snack_bar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpForm extends HookConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();

    return Form(
      key: signUpForm,
      child: Column(
        children: [
          SignUpEmailField(controller: emailController),
          const SizedBox(height: 24.0),
          SignUpPasswordField(controller: passwordController),
          const SizedBox(height: 24.0),
          SignUpButton(
            onPressed: () {
              if (signUpForm.currentState!.validate()) {
                ref
                    .read(authenticationControllerProvider.notifier)
                    .signUpWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
              } else {
                showSnackBar(context, 'Email or password is wrong.');
              }
            },
          ),
        ],
      ),
    );
  }
}
