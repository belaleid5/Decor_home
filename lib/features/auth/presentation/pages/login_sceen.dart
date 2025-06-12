import 'package:decor_app/core/functions/build_app_bar.dart';
import 'package:decor_app/core/responsive/responsive_fremwork.dart';
import 'package:decor_app/features/auth/presentation/widgets/login_screen_body_decktop.dart';

import 'package:decor_app/features/auth/presentation/widgets/login_screen_body_mobile.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,'Login'),
      body:  ResponsiveLayout(
      mobile: const LoginScreenBodyMobile(),
      desktop: const LoginDesktopView(),
    )
    );
    
  }
}


