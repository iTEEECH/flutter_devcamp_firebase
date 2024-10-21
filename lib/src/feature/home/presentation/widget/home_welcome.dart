import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeWelcome extends ConsumerWidget {
  const HomeWelcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<String?> data = ref.watch(usernameProvider);
    return switch (data) {
      AsyncData(value: final username) => Text('Welcome $username'),
      AsyncError() => Text('Error: ${data.error}'),
      _ => const CircularProgressIndicator(),
    };
  }
}
