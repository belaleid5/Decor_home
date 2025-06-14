import 'package:decor_app/core/functions/build_app_bar.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,"Create Account",true),
      body: SignUpScreenBody(),
    );
  }
}