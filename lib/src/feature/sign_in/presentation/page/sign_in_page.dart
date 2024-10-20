import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_in/presentation/widget/sign_in_body.dart';
import 'package:flutter_devcamp_firebase/src/widget/scaffold_custom.dart';
import 'package:flutter_devcamp_firebase/src/widget/snack_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  static String get routeName => 'Sign in';

  static String get routeLocation => '/sign_in';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authenticationControllerProvider,
      (_, state) {
        state.whenOrNull(
          error: (err, stackTrace) => showSnackBar(
            context,
            err.toString(),
          ),
        );
      },
    );

    return const ScaffoldCustom(
      title: 'Sign In',
      body: SignInBody(),
    );
  }
}
