import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_devcamp_firebase/src/core/firebase/firebase_provider.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final Ref ref;

  AuthenticationRepositoryImpl({required this.ref});

  @override
  Future<String?> fetchUsername() async {
    try {
      final String? uid = ref.watch(firebaseAuthProvider).currentUser?.uid;

      if(uid == null) {
        return null;
      }

      final String? username = await ref
          .read(authenticationRemoteProvider)
          .fetchUsername(uid: uid);

      return username;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final User? user = await ref
          .read(authenticationRemoteProvider)
          .signUpWithEmailAndPassword(
            email: email,
            password: password,
            username: username,
          );

      return user;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final User? user = await ref
          .read(authenticationRemoteProvider)
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          );

      return user;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await ref.read(authenticationRemoteProvider).signOut();
    } catch(_) {
      rethrow;
    }
  }
}
