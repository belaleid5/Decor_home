import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/features/splash/presentation/widgets/logo_animations.dart';
import 'package:decor_app/features/splash/presentation/widgets/text_revel_animation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoAnimationsPage(),
            const SizedBox(height: 20),
            TextRevealAnimation(
              text: "HOME",
              textStyle: AppTextStyles.poppins58.copyWith(color: Colors.white),
              delay: const Duration(
                milliseconds: 1500,
              ), // تأخير بعد رسم الأيقونة
              duration: const Duration(milliseconds: 800),
            ),

            TextRevealAnimation(
              text: "DECOR",
              textStyle: AppTextStyles.inter33.copyWith(
                color: Colors.white,
                letterSpacing: 14,
              ),
              delay: const Duration(milliseconds: 1800), // تأخير بعد ظهور HOME
              duration: const Duration(milliseconds: 800),
            ),
          ],
        ),
      ),
    );
  }
}
