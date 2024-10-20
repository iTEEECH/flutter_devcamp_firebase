import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_up/sign_up.dart';
import 'package:flutter_devcamp_firebase/src/widget/scaffold_custom.dart';
import 'package:flutter_devcamp_firebase/src/widget/snack_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  static String get routeName => 'Sign up';

  static String get routeLocation => '/sign_up';

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
     title: 'Sign up',
     body: SignUpBody(),
   );
  }
}
