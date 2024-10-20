import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_devcamp_firebase/src/core/firebase_auth/firebase_auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../_gen/src/feature/authentication/presentation/provider/authentication_provider.g.dart';

@riverpod
User? currentUser(CurrentUserRef ref) {
  final User? user = ref.watch(firebaseAuthProvider).currentUser;
  return user ;
}