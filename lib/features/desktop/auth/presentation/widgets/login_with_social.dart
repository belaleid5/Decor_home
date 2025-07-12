import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_images.dart';
import 'package:decor_app/features/desktop/auth/presentation/widgets/custom_social_login.dart';
import 'package:flutter/material.dart';

class LoginWithSocial extends StatelessWidget {
  const LoginWithSocial({
    super.key,
    required this.res,
  });

  final ResponsiveHelper res;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        CustomSocialLogin(
          res: res,
          image: AppImages.googleIconLogin,
          name: 'Google',
        ),
        CustomSocialLogin(
          res: res,
          image: AppImages.facebookIconLogin,
          name: 'Facebook',
        ),
      ],
    );
  }
}