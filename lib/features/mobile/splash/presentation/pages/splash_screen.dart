import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/routing/app_router.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/features/mobile/auth/presentation/blocs/auth_cubit.dart';
import 'package:decor_app/features/mobile/splash/presentation/widgets/logo_animations.dart';
import 'package:decor_app/features/mobile/splash/presentation/widgets/text_revel_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override


    @override
    void initState() {
      super.initState();
      Future.delayed(const Duration(milliseconds: 3700), checkAuthState);
    }



  Future<void> checkAuthState() async {
    final isLoggedIn = await context.read<AuthCubit>().checkIfLoggedIn();
    if (!mounted) return;
    Navigator.pushReplacementNamed(
      context,
      isLoggedIn ? AppRouter.mainRoute : AppRouter.loginRoute,
    );
  }


  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoAnimationsPage(),
            const SizedBox(height: 20),
            TextRevealAnimation(
              text: "HOME",
              textStyle:
                  res.isDesktop
                      ? AppTextStyles.poppins58(
                        context,
                      ).copyWith(color: Colors.white)
                      : AppTextStyles.poppins58(
                        context,
                      ).copyWith(color: Colors.white),
              delay: const Duration(milliseconds: 800),
              duration: const Duration(milliseconds: 1200),
            ),
            TextRevealAnimation(
              text: "DECOR",
              textStyle:
                  res.isDesktop
                      ? AppTextStyles.inter33(
                        context,
                      ).copyWith(color: Colors.white, letterSpacing: 12)
                      : AppTextStyles.inter33(
                        context,
                      ).copyWith(color: Colors.white, letterSpacing: 12),
              delay: const Duration(milliseconds: 800),
              duration: const Duration(milliseconds: 1300),
            ),
          ],
        ),
      ),
    );
  }
}
