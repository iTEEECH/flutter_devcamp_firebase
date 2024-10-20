import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSignOutButton extends ConsumerWidget {

  const HomeSignOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => ref.read(authenticationControllerProvider.notifier).signOut(),
      child: const Text('Logout'),
    );
  }
}