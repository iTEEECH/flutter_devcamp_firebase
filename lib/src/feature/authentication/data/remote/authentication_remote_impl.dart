import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_devcamp_firebase/src/core/firebase/firebase_provider.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRemoteImpl extends AuthenticationRemote {
  final Ref ref;

  AuthenticationRemoteImpl({required this.ref});

  @override
  Future<String?> fetchUsername({required String uid}) async {
    try {
      final DocumentSnapshot doc = await ref.read(firebaseFirestoreProvider).collection('user').doc(uid).get();
      return doc['username'];
    } catch (_) {
    rethrow;
    }
  }

  @override
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final UserCredential userCredential = await ref.read(firebaseAuthProvider).createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user != null) {
        await ref.read(firebaseFirestoreProvider).collection('user').doc(user.uid).set({
          'uid': user.uid,
          'email': email,
          'username': username,
        });
      }
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
      final UserCredential userCredential = await ref.read(firebaseAuthProvider).signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await ref.read(firebaseAuthProvider).signOut();
    } catch (_) {
      rethrow;
    }
  }
}
