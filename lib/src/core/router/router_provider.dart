import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/core/router/router_listenable.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_up/presentation/page/sign_up_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_devcamp_firebase/src/feature/home/home.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_in/sign_in.dart';

part '../../../_gen/src/core/router/router_provider.g.dart';

@riverpod
Raw<GoRouter> router(RouterRef ref) {
  final navigatorKey = GlobalKey<NavigatorState>();

  final redirectNotifier = ref.watch(routerListenableProvider.notifier);

  final GoRouter router = GoRouter(
    initialLocation: '/sign_in',
    navigatorKey: navigatorKey,
    redirect: redirectNotifier.redirect,
    refreshListenable: redirectNotifier,
    routes: <RouteBase>[
      GoRoute(
        path: HomePage.routeLocation,
        name: HomePage.routeName,
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        path: SignInPage.routeLocation,
        name: SignInPage.routeName,
        builder: (_, __) => const SignInPage(),
      ),
      GoRoute(
        path: SignUpPage.routeLocation,
        name: SignUpPage.routeName,
        builder: (_, __) => const SignUpPage(),
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
}
