import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../_gen/src/feature/authentication/data/remote/authentication_remote.g.dart';

@Riverpod(keepAlive: true)
AuthenticationRemote authenticationRemote(AuthenticationRemoteRef ref) {
  return AuthenticationRemoteImpl(ref: ref);
}

abstract class AuthenticationRemote {
  Future<String?> fetchUsername({required String uid});

  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}