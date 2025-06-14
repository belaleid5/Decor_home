import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/login_screen_body_mobile.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
      slivers: [
        SliverAppBar(
        pinned: true,
        floating: false,
        centerTitle: true,
        title:  Text('Login', style: AppTextStyles.inter20(
          context,
        ).copyWith(color: AppColor.primaryColor),),
        automaticallyImplyLeading: false,
        ),
        SliverFillRemaining(
        hasScrollBody: false,
        child: LoginScreenBodyMobile(),
        ),
      ],
      ),
    );
    
  }
}


