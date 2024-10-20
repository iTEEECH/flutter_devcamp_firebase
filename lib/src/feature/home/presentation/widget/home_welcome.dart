import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeWelcome extends ConsumerWidget {
  const HomeWelcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? username = ref.watch(
      currentUserProvider.select((user) => user?.email),
    );
    return Text('Welcome $username');
  }
}
