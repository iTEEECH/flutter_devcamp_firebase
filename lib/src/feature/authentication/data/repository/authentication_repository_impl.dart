import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final Ref ref;

  final Future<SharedPreferences> sharedPreferences;

  static const String _kUserUID = 'userUID';

  AuthenticationRepositoryImpl({
    required this.ref,
    required this.sharedPreferences,
  });

  @override
  Future<String?> fetchUsername() async {
    try {
      final SharedPreferences sharedPreferences = await this.sharedPreferences;
      final String uid = sharedPreferences.getString(_kUserUID) ?? '';

      final String? username =
          await ref.read(authenticationRemoteProvider).fetchUsername(uid: uid);

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

      if (!(user == null)) {
        final SharedPreferences sharedPreferences =
            await this.sharedPreferences;
        await sharedPreferences.setString(_kUserUID, user.uid);
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
      final User? user = await ref
          .read(authenticationRemoteProvider)
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          );

      if (!(user == null)) {
        final SharedPreferences sharedPreferences =
            await this.sharedPreferences;
        await sharedPreferences.setString(_kUserUID, user.uid);
      }

      return user;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final SharedPreferences sharedPreferences =
      await this.sharedPreferences;
      await sharedPreferences.clear();
      await ref.read(authenticationRemoteProvider).signOut();
    } catch (_) {
      rethrow;
    }
  }
}
