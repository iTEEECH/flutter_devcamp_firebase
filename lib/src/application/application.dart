import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/core/firebase/firebase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_devcamp_firebase/src/core/router/router_provider.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider(s).
    final router = ref.watch(routerProvider);

    // Content.
    return MaterialApp.router(
      title: 'Flutter Devcamp Firebase Riverpod',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
