import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_in/sign_in.dart';
import 'package:flutter_devcamp_firebase/src/widget/snack_bar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInForm extends HookConsumerWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> signInForm = GlobalKey<FormState>();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();

    return Form(
      key: signInForm,
      child: Column(
        children: [
          SignInEmailField(controller: emailController),
          const SizedBox(height: 24.0),
          SignInPasswordField(controller: passwordController),
          const SizedBox(height: 24.0),
          SignInButton(
            onPressed: () {
              if (signInForm.currentState!.validate()) {
                ref
                    .read(authenticationControllerProvider.notifier)
                    .signInWithEmailAndPassword(
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
