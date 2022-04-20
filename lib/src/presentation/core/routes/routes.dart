import 'package:flutter/material.dart';
import 'package:flutter_apps/src/presentation/views/home/home.dart';
import 'package:flutter_apps/src/presentation/views/on_boarding/on_boarding_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    HomeView.routeName: (context) => const HomeView(),
    OnBoardingView.routeName: (context) => const OnBoardingView(),
  };
}