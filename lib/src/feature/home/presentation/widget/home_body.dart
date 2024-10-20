import 'package:flutter/material.dart';
import 'package:flutter_devcamp_firebase/src/feature/home/home.dart';

class HomeBody extends StatelessWidget {

  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeWelcome(),
        SizedBox(height: 24.0),
        HomeSignOutButton(),
      ],
    );
  }
}