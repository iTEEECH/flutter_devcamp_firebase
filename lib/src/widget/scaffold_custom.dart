import 'package:flutter/material.dart';

class ScaffoldCustom extends StatelessWidget {
  final String title;
  final Widget body;

  const ScaffoldCustom({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
        leading: Navigator.canPop(context)
            ? IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
            size: 24.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        )
            : null,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: body,
          ),
        ),
      ),
    );
  }
}
