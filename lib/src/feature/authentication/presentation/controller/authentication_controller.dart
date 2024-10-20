import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_devcamp_firebase/src/core/firebase_auth/firebase_auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../_gen/src/feature/authentication/presentation/controller/authentication_controller.g.dart';

@riverpod
class AuthenticationController extends _$AuthenticationController {
  @override
  Stream<User?> build() {
    return ref.watch(firebaseAuthProvider).authStateChanges();
  }


  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      await ref.read(firebaseAuthProvider).signInWithEmailAndPassword(
            email: email,
            password: password,
          );
    } catch (error, stackTrace) {
      state = AsyncError('Email or password is wrong.', stackTrace);
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      await ref.read(firebaseAuthProvider).createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error, stackTrace) {
      state = AsyncError('Error was occurred during sign up. $error', stackTrace);
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    try {
      await ref.read(firebaseAuthProvider).signOut();
    } catch (error, stackTrace) {
      state = AsyncError('Error was occurred during sign out.', stackTrace);
    }
  }
}
