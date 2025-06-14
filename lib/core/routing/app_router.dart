import 'package:decor_app/features/mobile/auth/presentation/pages/forget_password.dart';
import 'package:decor_app/features/mobile/auth/presentation/pages/login_sceen.dart';
import 'package:decor_app/features/mobile/auth/presentation/pages/set_pasword.dart';
import 'package:decor_app/features/mobile/auth/presentation/pages/sign_up_screen.dart';
import 'package:decor_app/features/mobile/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';

  static const String signUpRoute = '/signin';
  static const String forgetPasword = "/forgetPassword";
  static const String setPassword = '/setPassword';

  static MaterialPageRoute onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case forgetPasword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case setPassword:
        return MaterialPageRoute(builder: (_) => const SetPasswordScreen());
      // Add more routes here as needed

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
