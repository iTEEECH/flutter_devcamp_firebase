import 'package:flutter_devcamp_firebase/src/feature/authentication/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../_gen/src/feature/authentication/presentation/provider/authentication_provider.g.dart';

@riverpod
Future<String?> username(UsernameRef ref) {
  Future.delayed(const Duration(seconds: 5));
  return ref.watch(authenticationRepositoryProvider).fetchUsername();
}
