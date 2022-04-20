import 'package:flutter/material.dart';

class AppRouter {
  AppRouter({
    required this.context,
  });

  final BuildContext context;

  factory AppRouter.of(BuildContext context) {
    return AppRouter(context: context);
  }

  Future<dynamic> pushNamed(String name, {Object? arguments}) async {
    return await Navigator.of(context).pushNamed(name, arguments: arguments);
  }

  Future<dynamic> push(Widget page, {bool fullscreenDialog = false}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }
}
