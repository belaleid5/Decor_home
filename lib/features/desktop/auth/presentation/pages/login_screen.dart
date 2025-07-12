import 'package:decor_app/features/desktop/auth/presentation/widgets/login_screen_desktop.dart';
import 'package:flutter/material.dart';

class LoginScreenDesktop extends StatelessWidget {
  const LoginScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: LoginScreenDesktopBody(),
    );
  }
}
