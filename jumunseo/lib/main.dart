import 'package:flutter/material.dart';
import 'package:jumunseo/config/routes/app_routes.dart';
import 'package:jumunseo/config/theme/app_theme.dart';

Future<void> main() async {
  //TODO: 스플래시 스크린
  //TODO: 앱 초기화

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '주문서',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
