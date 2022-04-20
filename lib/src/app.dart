import 'package:flutter/material.dart';
import 'package:flutter_apps/src/presentation/core/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Apps',
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
    );
  }
}
