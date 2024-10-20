import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/home/presentation/widget/home_body.dart';
import 'package:flutter_devcamp_firebase/src/widget/scaffold_custom.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static String get routeName => 'Home';

  static String get routeLocation => '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ScaffoldCustom(
      title: 'Home',
      body: HomeBody(),
    );
  }
}
