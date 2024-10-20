import 'package:dio/dio.dart';
import 'package:flutter_devcamp_firebase/src/core/http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../_gen/src/core/http/http_provider.g.dart';

@Riverpod(keepAlive: true)
Dio http(HttpRef ref) {
  return Http().instance.dio;
}