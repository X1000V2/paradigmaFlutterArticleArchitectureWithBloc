import 'package:flutter/material.dart';
import 'package:flutter_bloc_plus_freezed/di/dependency_injection.dart';
import 'package:flutter_bloc_plus_freezed/pages/app_router.dart';

void main() {
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: appRouter,
    );
  }
}
