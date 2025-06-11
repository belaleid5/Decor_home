import 'package:decor_app/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';







class AppRouter {
  static const String splashRoute = '/splash';

static MaterialPageRoute onGenerate(RouteSettings settings) {

  switch (settings.name) {
    case splashRoute:
      return MaterialPageRoute(builder: (_) => const SplashScreen());

    // Add more routes here as needed
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
}
