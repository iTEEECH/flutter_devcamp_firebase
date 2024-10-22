import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part '../../../../../_gen/src/feature/authentication/domain/repository/authentication_repository.g.dart';

@Riverpod(keepAlive: true)
AuthenticationRepository authenticationRepository(AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(ref: ref, sharedPreferences: SharedPreferences.getInstance());
}

abstract class AuthenticationRepository {
  Future<String?> fetchUsername();

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