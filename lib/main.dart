import 'package:flutter/material.dart';
import 'package:rhymer/core/router/router.dart';
import 'package:rhymer/core/ui/theme/theme.dart';

void main() {
  runApp(const RhymerApp());
}

class RhymerApp extends StatefulWidget {
  const RhymerApp({super.key});

  @override
  State<RhymerApp> createState() => _RhymerAppState();
}

class _RhymerAppState extends State<RhymerApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rhymer',
      theme: themeData,
      routerConfig: _router.config(),
    );
  }
}
