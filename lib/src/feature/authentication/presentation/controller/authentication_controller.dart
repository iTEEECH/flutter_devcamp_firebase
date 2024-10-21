import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_devcamp_firebase/src/core/firebase/firebase_provider.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
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
      await ref
          .read(authenticationRepositoryProvider)
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          );
    } on FirebaseAuthException catch (error, stackTrace) {
      state = AsyncError('${error.message}', stackTrace);
    } catch (error, stackTrace) {
      state = AsyncError('An error occurred while connecting.', stackTrace);
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    state = const AsyncLoading();

    try {
      await ref
          .read(authenticationRepositoryProvider)
          .signUpWithEmailAndPassword(
            email: email,
            password: password,
            username: username,
          );
    } on FirebaseAuthException catch (error, stackTrace) {
      state = AsyncError('${error.message}', stackTrace);
    } catch (error, stackTrace) {
      state = AsyncError('An error occurred during registration.', stackTrace);
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    try {
      await ref.read(authenticationRepositoryProvider).signOut();
    } on FirebaseAuthException catch (error, stackTrace) {
      state = AsyncError('${error.message}', stackTrace);
    } catch (error, stackTrace) {
      state = AsyncError('An error occurred during sign out.', stackTrace);
    }
  }
}
