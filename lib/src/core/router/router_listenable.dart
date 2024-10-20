import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:flutter_devcamp_firebase/src/feature/home/home.dart';
import 'package:flutter_devcamp_firebase/src/feature/sign_in/sign_in.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../feature/sign_up/presentation/page/sign_up_page.dart';

part '../../../_gen/src/core/router/router_listenable.g.dart';

@riverpod
class RouterListenable extends _$RouterListenable implements Listenable {
  VoidCallback? _routerListener;

  @override
  Future<void> build() async {
    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      _routerListener?.call();
    });
  }

  Future<String?> redirect(BuildContext context, GoRouterState state) async {
   final authState = ref.watch(authenticationControllerProvider);

    if (authState.isLoading || authState.hasError) return null;

    final bool isAuth = authState.valueOrNull != null;

    print('isAuth $isAuth');

    if(state.matchedLocation == SignInPage.routeLocation) {
      return isAuth ? HomePage.routeLocation : null;
    }

   if(state.matchedLocation == SignUpPage.routeLocation) {
     return isAuth ? HomePage.routeLocation : SignUpPage.routeLocation;
   }

   return isAuth ? null : SignInPage.routeLocation;
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
