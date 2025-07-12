import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/routing/app_router.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_animations/simple_animations.dart';

class SplashScreenDesktop extends StatelessWidget {
  const SplashScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _SplashScreenContent(),
    );
  }
}

class _SplashScreenContent extends StatelessWidget {
  const _SplashScreenContent();

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);

    // الانتقال إلى LoginScreen بعد 3.5 ثواني
    Future.delayed(const Duration(milliseconds: 3500), () {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRouter.loginDesRoute);
      }
    });

    // إنشاء MovieTween لتسلسل الأنيميشنات
    final movie = MovieTween()
      ..scene(
        begin: const Duration(milliseconds: 0),
        duration: const Duration(milliseconds: 3000),
      ).tween(
        'backgroundOpacity',
        Tween<double>(begin: 1.0, end: 0.8),
        curve: Curves.easeInOut,
      )
      ..scene(
        begin: const Duration(milliseconds: 0),
        duration: const Duration(milliseconds: 1200),
      )
          .tween(
            'logoOpacity',
            Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.easeInOut,
          )
          .tween(
            'logoScale',
            Tween<double>(begin: 0.7, end: 1.0),
            curve: Curves.bounceOut,
          )
          .tween(
            'logoRotation',
            Tween<double>(begin: -0.05, end: 0.0),
            curve: Curves.easeInOut,
          )
      ..scene(
        begin: const Duration(milliseconds: 1400),
        duration: const Duration(milliseconds: 800),
      )
          .tween(
            'homeOpacity',
            Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.easeInOut,
          )
          .tween(
            'homeSlide',
            Tween<double>(begin: 20.0, end: 0.0),
            curve: Curves.easeInOut,
          )
          .tween(
            'homeScale',
            Tween<double>(begin: 0.9, end: 1.0),
            curve: Curves.easeOut,
          )
      ..scene(
        begin: const Duration(milliseconds: 2000),
        duration: const Duration(milliseconds: 800),
      )
          .tween(
            'decorOpacity',
            Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.easeInOut,
          )
          .tween(
            'decorSlide',
            Tween<double>(begin: 20.0, end: 0.0),
            curve: Curves.easeInOut,
          )
          .tween(
            'decorScale',
            Tween<double>(begin: 0.9, end: 1.0),
            curve: Curves.easeOut,
          );

    return PlayAnimationBuilder<Movie>(
      tween: movie,
      duration: movie.duration,
      builder: (context, anim, child) {
        return Container(
          color: AppColor.primaryColor.withOpacity(anim.get('backgroundOpacity')),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform(
                  transform: Matrix4.identity()
                    ..scale(anim.get('logoScale'))
                    ..rotateZ(anim.get('logoRotation')),
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: anim.get('logoOpacity'),
                    child: SvgPicture.asset(
                      AppImages.logoSplash, // غيّري المسار لو مختلف
                      width: res.wp(20),
                      height: res.hp(20),
                    ),
                  ),
                ),
                SizedBox(height: res.hp(3)),
                _AnimatedRevealText(
                  text: 'HOME',
                  opacity: anim.get('homeOpacity'),
                  slideOffset: anim.get('homeSlide'),
                  scale: anim.get('homeScale'),
                  style: TextStyle(
                    fontSize: res.wp(10), // بديل لـ poppins58
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: res.hp(1)),
                _AnimatedRevealText(
                  text: 'DECOR',
                  opacity: anim.get('decorOpacity'),
                  slideOffset: anim.get('decorSlide'),
                  scale: anim.get('decorScale'),
                  style: TextStyle(
                    fontSize: res.wp(6), // بديل لـ inter33
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AnimatedRevealText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double opacity;
  final double slideOffset;
  final double scale;

  const _AnimatedRevealText({
    required this.text,
    required this.style,
    required this.opacity,
    required this.slideOffset,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Transform.translate(
        offset: Offset(0, slideOffset),
        child: Transform.scale(
          scale: scale,
          child: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }
}