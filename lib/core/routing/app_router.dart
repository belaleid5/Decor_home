import 'package:decor_app/core/services/service_locator.dart';
import 'package:decor_app/features/desktop/auth/presentation/pages/login_screen.dart';
import 'package:decor_app/features/desktop/splash/presentation/pages/splash_screen_desktop.dart';
import 'package:decor_app/features/mobile/auth/domain/use_cases/login_user_usecase.dart';
import 'package:decor_app/features/mobile/auth/presentation/blocs/auth_cubit.dart';
import 'package:decor_app/features/mobile/auth/presentation/pages/forget_password.dart';
import 'package:decor_app/features/mobile/auth/presentation/pages/login_sceen.dart';
import 'package:decor_app/features/mobile/auth/presentation/pages/set_pasword.dart';
import 'package:decor_app/features/mobile/auth/presentation/pages/sign_up_screen.dart';
import 'package:decor_app/features/mobile/home/presentation/pages/main_screen.dart';
import 'package:decor_app/features/mobile/search/presentation/pages/filter_search_screen.dart';
import 'package:decor_app/features/mobile/search/presentation/pages/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/mobile/auth/domain/use_cases/create_user_usecase.dart';
import '../../features/mobile/splash/presentation/pages/splash_screen.dart';

class AppRouter {
  static const splashRoute = '/splash';
  static const loginRoute = '/login';

  static const signUpRoute = '/signin';
  static const forgetPasword = "/forgetPassword";
  static const setPassword = '/setPassword';
  static const mainRoute = "/home";
  static const searchRoute = "/search";
  static const filterSearchRoute = "/filterSearch";

  //desktop routes
  static const loginDesRoute = '/loginDes';
  static const splashDesRoute = '/splashDes';

  static MaterialPageRoute onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<AuthCubit>(
                create:
                    (_) => AuthCubit(
                      sl(),
                      loginUseCase: sl<LoginUseCase>(),
                      signUpUseCase: sl<SignUpUseCase>(),
                    ),
                child: const SplashScreen(),
              ),
        );

      case signUpRoute:
       
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<AuthCubit>(
                create:
                    (_) => AuthCubit(
                      sl(),
                      loginUseCase: sl<LoginUseCase>(),
                      signUpUseCase: sl<SignUpUseCase>(),
                    ),
                child: const SignUpScreen(),
              ),
        );

      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case forgetPasword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case setPassword:
        return MaterialPageRoute(builder: (_) => const SetPasswordScreen());
      case searchRoute:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case filterSearchRoute:
        return MaterialPageRoute(builder: (_) => const FilterSearchScreen());

      //desktop routing
      case loginDesRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreenDesktop());

      case splashDesRoute:
        return MaterialPageRoute(builder: (_) => SplashScreenDesktop());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
