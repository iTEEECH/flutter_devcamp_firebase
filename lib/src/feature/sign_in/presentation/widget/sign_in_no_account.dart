import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/core/router/router_provider.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_up/sign_up.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInNoAccount extends ConsumerWidget {
  final VoidCallback? onPressed;

  const SignInNoAccount({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () => ref.read(routerProvider).push(SignUpPage.routeLocation),
      child: const Text('No account yet ?'),
    );
  }
}
